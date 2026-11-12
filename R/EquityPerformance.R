# EquityPerformance.R
# This will look at the latest equity performance
require(quantmod)
require(PerformanceAnalytics)
mysymbols <- c("IVE", "IVW", "SPY", "TLT")
getSymbols(mysymbols)
plot(Cl(IVE)/Cl(IVW), main = "Growth / Value")
plot(Cl(IVE)["2026-06/"]/Cl(IVW)["2026-06/"], main = "Growth / Value")
plot(Cl(SPY)/Cl(TLT), main = "SPY/TLT")
plot(Cl(SPY)["2026-06/"]/Cl(TLT)["2026-06/"], main = "SPY/TLT")
