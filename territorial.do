
use "C:\Users\crrc12\Desktop\NickBarker\Data\NDI_2018_Mar_16.04.18_Public-nw.dta", clear

set more off

////// Weights
svyset PSU [pweight=WTIND], strata(SUBSTRATUM) fpc(NPSUSS)singleunit(certainty) || ID, fpc(NHHPSU) || _n, fpc(NADHH)


///// Variables 


/// DV recode FUTTERINT Base category = 1 Agree

recode FUTTERINT (1=1) (0=2) (-1=3) (else=.), gen(FUTTERINT_r) 
label var FUTTERINT_r "Regain territorial integrity"

label define FUTTERINT_r 1 "Agree", modify
label define FUTTERINT_r 2 "Disagree", modify
label define FUTTERINT_r 3 "Don't Know", modify

label values FUTTERINT_r FUTTERINT_r 


///Demographic variables 

// SUBSTRATUM Base category 03 = Rural

recode SUBSTRATUM (10=1) (21/34=2) (51=2) (41/44=3) (52=3), gen (SUBSTRATUM_r)

label var SUBSTRATUM_r "Settlement type"

label define SUBSTRATUM_r 1 "Capital", modify 
label define SUBSTRATUM_r 2 "Urban", modify 
label define SUBSTRATUM_r 3 "Rural", modify 

label values SUBSTRATUM_r SUBSTRATUM_r



// Ethnicity Base category = Georgian 
ETHNOCODE


// Sex Base category = male
RESPSEX 


// Age Base category = 18-34
AGEGROUP 


// Education Base category = Higher than secondary

recode RESPEDU (1/3=1) (4=2) (5/6=3) (else=.), gen(RESPEDU_r)

label var RESPEDU_r "Education"

label define RESPEDU_r 1 "Secondary or lower", modify
label define RESPEDU_r 2 "Vocational/technical degree", modify
label define RESPEDU_r 3 "Higher than secondary", modify 

label values RESPEDU_r RESPEDU_r 


/// Political attitudes

// Party support Base category = Georgian Dream

recode PARTYSUPP1 (8=1) (6=2) (7=3) (-1=4) (26=4) (1/5=5) (9/25=5) (else=.), gen(PARTYSUPP1_r)

label var PARTYSUPP1_r "Party Support"

label define PARTYSUPP1_r 1 "Georgian Dream", modify
label define PARTYSUPP1_r 2 "UNM", modify
label define PARTYSUPP1_r 3 "European Georgia", modify 
label define PARTYSUPP1_r 4 "No party/Don't know", modify
label define PARTYSUPP1_r 5 "Other party", modify
 

label value PARTYSUPP1_r PARTYSUPP1_r


// Political Direction Base category = No Change

recode POLDIRN (1/2=1) (3=2) (4/5=3) (else=.), gen(POLDIRN_r)

label var POLDIRN_r "Political Direction"

label define POLDIRN_r 1 "Wrong Direction", modify
label define POLDIRN_r 2 "No Change", modify 		
label define POLDIRN_r 3 "Right Direction", modify

label value POLDIRN_r POLDIRN_r


/// recode2 for tetrachoric correlation

recode POLDIRN (4/5=1) (else=0), gen(POLDIRN_r2)

label var POLDIRN_r2 "Political Direction 2"

label define POLDIRN_r2 1 "Right direction", modify
label define POLDIRN_r2 0 "Other", modify

label value POLDIRN_r2 POLDIRN_r2


/// Foreign policy/security attitudes
 
// recode JOINEU, base category = DK

recode JOINEU (1=1) (0=2) (-1=3) (else=.), gen(JOINEU_r)

label var JOINEU_r "Approve/Disapprove joining EU"

label define JOINEU_r 1 "EU Approve", modify
label define JOINEU_r 2 "EU Disapprove", modify
label define JOINEU_r 3 "EU Don't Know", modify

label value JOINEU_r JOINEU_r


// recode2 JOINEU for tetrachoric correlation

recode JOINEU (1=1) (else=0), gen(JOINEU_r2)

label var JOINEU_r2 "Approve EU"

label define JOINEU_r2 1 "EU Approve", modify
label define JOINEU_r2 0 "Other", modify

label value JOINEU_r2 JOINEU_r2


// recode GENATO, base category = DK

recode GENATO (1=1) (0=2) (-1=3) (else=.), gen(GENATO_r)

label var GENATO_r "Approve/Disapprove joining NATO"

label define GENATO_r 1 "NATO Approve", modify
label define GENATO_r 2 "NATO Disapprove", modify
label define GENATO_r 3 "NATO Don't Know", modify

label value GENATO_r GENATO_r

// recode2 GENATO for tetrachoric correlation

recode GENATO (1=1)(else=0), gen(GENATO_r2)

label var GENATO_r2 "Approve NATO"

label define GENATO_r2 1 "NATO approve", modify
label define GENATO_r2 0 "Other", modify

label value GENATO_r2 GENATO_r2


// Defence capabilities base category = Stayed the same

recode DEFCAINCR (1=1) (2=2) (3=3) (-1=4) (else=.), gen(DEFCAINC_r)

label var DEFCAINC_r "Georgian defence capabilities"

label define DEFCAINC_r 1 "DefCap Worsened", modify
label define DEFCAINC_r 2 "DefCap Stayed the same", modify
label define DEFCAINC_r 3 "DefCap Improved", modify
label define DEFCAINC_r 4 "DefCap DK", modify

label value DEFCAINC_r DEFCAINC_r


// recode2 DEFCAINCR for tetrachoric correlation

recode DEFCAINCR (3=1) (else=0), gen(DEFCAINC_r2)

label var DEFCAINC_r2 "Georgian defence capabilities 2"

label define DEFCAINC_r2 1 "DefCap Improved", modify
label define DEFCAINC_r2 0 "Other", modify

label value DEFCAINC_r2 DEFCAINC_r2



// US MilAid base category = Stayed the same

recode USMILAID (1=1) (2=2) (3=3) (-1=4) (else=.), gen(USMILAID_r)

label var USMILAID_r "US military assistance"

label define USMILAID_r 1 "US MilAid Decreased", modify
label define USMILAID_r 2 "US MilAid Stayed the same", modify
label define USMILAID_r 3 "US MilAid Increased", modify
label define USMILAID_r 4 "US MilAid DK", modify

label value USMILAID_r USMILAID_r


// recode2 US MilAid for tetrachoric correlation

recode USMILAID (3=1) (else=0), gen(USMILAID_r2)

label var USMILAID_r2 "US MilAid binary"

label define USMILAID_r2 1 "US MilAid Increased", modify
label define USMILAID_r2 0 "Other", modify

label value USMILAID_r2 USMILAID_r2


///// Crosstab for US military aid and territorial integrity 
tab USMILAID_r FUTTERINT_r, row col


////// tetrachoric correlation

tetrachoric GENATO_r2 JOINEU_r2    /// 0.7686
tetrachoric GENATO_r2 DEFCAINC_r2 /// 0.2680
tetrachoric GENATO_r2 USMILAID_r2 /// 0.3655
tetrachoric GENATO_r2 POLDIRN_r2 /// 0.1321

tetrachoric POLDIRN_r2 DEFCAINC_r2  /// 0.4590
tetrachoric POLDIRN_r2 USMILAID_r2  /// 0.2392
tetrachoric POLDIRN_r2 JOINEU_r2 	/// 0.2009

tetrachoric USMILAID_r2 DEFCAINC_r2  /// 0.5403 
tetrachoric USMILAID_r2 JOINEU_r2   ///  0.3525

tetrachoric JOINEU_r2 DEFCAINC_r2 /// 0.2896



/////// mlogit

/// Model 1: Regain territorial integrity FUTTERINT_r // GENATO_r
 
qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r b03.GENATO_r b02.DEFCAINC_r b02.USMILAID_r, base (3)
margins, dydx(*) predict(outcome(1)) post  
estimates store Agree1

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r b03.GENATO_r b02.DEFCAINC_r b02.USMILAID_r, base (3)
margins, dydx(*) predict(outcome(2)) post  
estimates store Disagree1

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r b03.GENATO_r b02.DEFCAINC_r b02.USMILAID_r, base (3)
margins, dydx(*) predict(outcome(3)) post  
estimates store DK1

coefplot Agree1|| Disagree1 || DK1, keep(*.USMILAID_r *.POLDIRN_r *.GENATO_r *.DEFCAINC_r) xline(0) 



/// Model 2: Regain territorial integrity FUTTERINT_r // JOINEU_r

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r b03.JOINEU_r b02.DEFCAINC_r b02.USMILAID_r, base (3)
margins, dydx(*) predict(outcome(1)) post  
estimates store Agree2

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r b03.JOINEU_r b02.DEFCAINC_r b02.USMILAID_r, base (3)
margins, dydx(*) predict(outcome(2)) post  
estimates store Disagree2

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r b03.JOINEU_r b02.DEFCAINC_r b02.USMILAID_r, base (3)
margins, dydx(*) predict(outcome(3)) post  
estimates store DK2

coefplot Agree2|| Disagree2 || DK2, keep(*.USMILAID_r *.POLDIRN_r *.JOINEU_r *.DEFCAINC_r) xline(0) 


/// Coefplots models 1 and 2

coefplot Agree1|| Disagree1 || DK1 ||  Agree2|| Disagree2 || DK2, keep( *.POLDIRN_r *.GENATO_r *.JOINEU_r *.USMILAID_r *.DEFCAINC_r) xline(0)


/// Model 3: Regain territorial integrity FUTTERINT_r // just demographics and political attitudes (not used in text)


qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r, base (3)
margins, dydx(*) predict(outcome(1)) post  
estimates store Agree3

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r, base (3)
margins, dydx(*) predict(outcome(2)) post  
estimates store Disagree3

qui svy: mlogit FUTTERINT_r i.RESPSEX i.AGEGROUP b01.ETHNOCODE b03.SUBSTRATUM_r b03.RESPEDU_r b01.PARTYSUPP1_r b02.POLDIRN_r, base (3)
margins, dydx(*) predict(outcome(3)) post  
estimates store DK3

coefplot Agree3|| Disagree3 || DK3, drop(_cons) xline(0) 



