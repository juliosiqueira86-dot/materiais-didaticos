# =====================================================================
# Estudo de caso: homicídios no RJ (ISP, 2000-2019) -- replicação em Python
# Material original cedido por Marcello M. Provenza (Provenza et al., 2022).
# Estatística Computacional -- UERJ 2026.2 -- Prof. Julio C. Siqueira
# Pacotes: pip install pandas openpyxl scipy statsmodels
# Coloque este script na mesma pasta de taxa_hd.xlsx e rode tudo.
# =====================================================================
import numpy as np
import pandas as pd
import statsmodels.formula.api as smf
from scipy import stats
from statsmodels.stats.diagnostic import het_breuschpagan, het_goldfeldquandt
from statsmodels.stats.stattools import durbin_watson
from statsmodels.stats.outliers_influence import variance_inflation_factor

crimes = pd.read_excel("taxa_hd.xlsx").iloc[:, :4]
crimes["ano"] = range(2000, 2020)
print(crimes[["hd", "lat", "ar", "th"]].describe().round(2))
print(crimes[["hd", "lat", "ar", "th"]].corr().round(3))

form = ["hd ~ lat", "hd ~ th", "hd ~ ar", "hd ~ lat + th",
        "hd ~ lat + ar", "hd ~ th + ar", "hd ~ lat + th + ar"]
tab = []
for f in form:
    m = smf.ols(f, data=crimes).fit()
    # o statsmodels não conta sigma^2 no AIC/BIC: +2 e +log(n) igualam aos do R
    tab.append([f, round(m.rsquared_adj, 3), round(m.aic + 2, 3), round(m.bic + np.log(m.nobs), 3)])
print(pd.DataFrame(tab, columns=["modelo", "R2aj", "AIC", "BIC"]))

fit7 = smf.ols("hd ~ lat + th + ar", data=crimes).fit()
X = fit7.model.exog
print({n: float(round(variance_inflation_factor(X, j), 3))
       for j, n in enumerate(fit7.model.exog_names) if n != "Intercept"})

fit = smf.ols("hd ~ lat + th", data=crimes).fit()
print(fit.summary())
r = fit.resid
print("Shapiro-Wilk p =", round(stats.shapiro(r).pvalue, 4))
print("Breusch-Pagan p =", round(het_breuschpagan(r, fit.model.exog)[1], 4))
print("Goldfeld-Quandt p =", round(het_goldfeldquandt(crimes["hd"], fit.model.exog)[1], 4))
print("Durbin-Watson =", round(durbin_watson(r), 4))
print(fit.outlier_test().sort_values("bonf(p)").head(1).round(4))
