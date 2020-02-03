/***

# Title

__[getvdata](https://github.com/thomasgstewart/rms)__ -- slurp datasets listed on the Vanderbilt Biostatistics Website


## Syntax

__getvdata__ key


## Description

__getvdata__ will slurp datasets listed on the Vanderbilt Biostatistics Website using a key.

## Example

    List some available keys
        . getvdata

    Slurp a specific dataset
        . getvdata prostate

## Author

Thomas G. Stewart
Department of Biostatistics
Vanderbilt University School of Medicine
thomas.stewart@vanderbilt.edu
***/

*capture program drop getvdata

program getvdata
args key

if `"`key'"' == "" {
  display "Function will load datasets from the collection at"
  display "Vanderbilt Biostatistics (http://biostat.mc.vanderbilt.edu/DataSets)"
  display " "
  display "syntax: getvdata key"
  display " "
  display "Keys of available datasets: abm, acath, birth_estriol, cdystonia,"
  display "diabetes, dmd, esopH, FEV, lead, nhgh, pbc, prostate, rhc, "
  display "sex.age.response, stressEcho, support, titanic3, valung, "
  display "1.3.2.Sepsis, 1.4.11.Sepsis, 10.7.ERpolymorphism, "
  display "11.2.Isoproterenol, 11.2.Long.Isoproterenol, 11.AreaUnderCurve, "
  display "2.12.Poisson, 2.18.Funding, 2.20.Framingham, 2.ex.vonHippelLindau, "
  display "3.ex.Funding, 4.11.Sepsis, 4.18.Sepsis, 4.21.EsophagealCa, "
  display "4.ex.Sepsis, 5.5.EsophagealCa, 5.ex.InjuryDeath, 6.9.Hemorrhage, "
  display "6.ex.Breast, 8.12.Framingham, 8.7.Framingham, 8.8.2.Person-Years, "
  display "8.8.2.Survival, 8.ex.InjuryDeath, 11.ex.Sepsis"
  display " "
  display `"Keys for Whitlock and Schluter datasets are {browse "http://biostat.mc.vanderbilt.edu/MsciBiostatIIDatasets":here (link)}."'
  exit
}
else if `"`key'"' == "02-e-2a" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2aDeathsFromTigers.csv", clear
  exit
}
else if `"`key'"' == "02-e-2b" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2bDesertBirdAbundance.csv", clear
  exit
}
else if `"`key'"' == "02-e-3a" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3aBirdMalaria.csv", clear
  exit
}
else if `"`key'"' == "02-e-3b" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3bGuppyFatherSonAttractiveness.csv", clear
  exit
}
else if `"`key'"' == "02-e-3c" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3cHumanHemoglobinElevation.csv", clear
  exit
}
else if `"`key'"' == "02-e-4a" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e4aMeaslesOutbreaks.csv", clear
  exit
}
else if `"`key'"' == "02-q-05" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q05FrySurvival.csv", clear
  exit
}
else if `"`key'"' == "02-q-06" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q06EndangeredSpecies.csv", clear
  exit
}
else if `"`key'"' == "02-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q07FamineSchizophrenia.csv", clear
  exit
}
else if `"`key'"' == "02-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q12ConvictionsAndIncome.csv", clear
  exit
}
else if `"`key'"' == "02-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q17AnemonePersonality.csv", clear
  exit
}
else if `"`key'"' == "02-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv", clear
  exit
}
else if `"`key'"' == "02-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q22CriminalConvictions.csv", clear
  exit
}
else if `"`key'"' == "02-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q26NeotropicalTreePhotosynthesis.csv", clear
  exit
}
else if `"`key'"' == "02-q-28" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q28SneakerCannibalism.csv", clear
  exit
}
else if `"`key'"' == "02-q-32" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q32ToxoplasmaAccidents.csv", clear
  exit
}
else if `"`key'"' == "02-q-33" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q33BirthMonthADHD.csv", clear
  exit
}
else if `"`key'"' == "02-q-35" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q35FoodReductionLifespan.csv", clear
  exit
}
else if `"`key'"' == "02-q-37" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q37Hurricanes.csv", clear
  exit
}
else if `"`key'"' == "03-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03e1GlidingSnakes.csv", clear
  exit
}
else if `"`key'"' == "03-t-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q12and22CriminalConvictions.csv", clear
  exit
}
else if `"`key'"' == "03-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03e2SpiderAmputation.csv", clear
  exit
}
else if `"`key'"' == "03-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03e3SticklebackPlates.csv", clear
  exit
}
else if `"`key'"' == "03-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q01SystolicBP.csv", clear
  exit
}
else if `"`key'"' == "03-q-02" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q02SystolicBP.csv", clear
  exit
}
else if `"`key'"' == "03-q-04" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q04KenyaFinches.csv", clear
  exit
}
else if `"`key'"' == "03-q-09" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q09Rigormortis.csv", clear
  exit
}
else if `"`key'"' == "03-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q14VasopressinVoles.csv", clear
  exit
}
else if `"`key'"' == "03-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q15DietBreadthElVerde.csv", clear
  exit
}
else if `"`key'"' == "03-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q19SparrowReproductiveSuccess.csv", clear
  exit
}
else if `"`key'"' == "03-q-21" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q21YeastMutantGrowth.csv", clear
  exit
}
else if `"`key'"' == "03-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q22ZebraFishBoldness.csv", clear
  exit
}
else if `"`key'"' == "03-q-28" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q28SeaUrchinBindin.csv", clear
  exit
}
else if `"`key'"' == "04-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04e1HumanGeneLengths.csv", clear
  exit
}
else if `"`key'"' == "04-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04q07FireflyFlash.csv", clear
  exit
}
else if `"`key'"' == "04-q-09" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04q09NumberGenesRegulated.csv", clear
  exit
}
else if `"`key'"' == "04-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04q18Corpseflowers.csv", clear
  exit
}
else if `"`key'"' == "07-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07e2SexAndX.csv", clear
  exit
}
else if `"`key'"' == "07-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07e3RadiologistOffspringSex.csv", clear
  exit
}
else if `"`key'"' == "07-q-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q2QuestionEar.csv", clear
  exit
}
else if `"`key'"' == "07-q-03" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q03LostWallets.csv", clear
  exit
}
else if `"`key'"' == "07-q-04" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q04GenghisKhanCancer.csv", clear
  exit
}
else if `"`key'"' == "07-q-05" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q05CocaineDollars.csv", clear
  exit
}
else if `"`key'"' == "07-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q07FollicleMites.csv", clear
  exit
}
else if `"`key'"' == "07-q-08" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q08GardenSpiderCannibalism.csv", clear
  exit
}
else if `"`key'"' == "07-q-09" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q09ClimateRangeShifts.csv", clear
  exit
}
else if `"`key'"' == "07-q-11" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q11FetalTestosterone.csv", clear
  exit
}
else if `"`key'"' == "07-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q14WaitingForChristmas.csv", clear
  exit
}
else if `"`key'"' == "07-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q15Latex.csv", clear
  exit
}
else if `"`key'"' == "07-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q16HeroinDollars.csv", clear
  exit
}
else if `"`key'"' == "07-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q18SelectiveLooking.csv", clear
  exit
}
else if `"`key'"' == "07-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q19CutsFromFood.csv", clear
  exit
}
else if `"`key'"' == "07-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q20LoveThroughPets.csv", clear
  exit
}
else if `"`key'"' == "07-q-23" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q23ButterSideDown.csv", clear
  exit
}
else if `"`key'"' == "07-q-23" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q23SurgicalSiteInfections.csv", clear
  exit
}
else if `"`key'"' == "07-q-25" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q25HelpingAtNest.csv", clear
  exit
}
else if `"`key'"' == "07-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q26DogFoodPate.csv", clear
  exit
}
else if `"`key'"' == "07-q-27" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q27SuicideSeason.csv", clear
  exit
}
else if `"`key'"' == "07-q-28" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q28RoadKill.csv", clear
  exit
}
else if `"`key'"' == "07-q-30" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q30CatfishHunting.csv", clear
  exit
}
else if `"`key'"' == "08-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e1DayOfBirth.csv", clear
  exit
}
else if `"`key'"' == "08-e-4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e4XGeneContent.csv", clear
  exit
}
else if `"`key'"' == "08-e-5" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e5NumberOfBoys.csv", clear
  exit
}
else if `"`key'"' == "08-e-6" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e6MassExtinctions.csv", clear
  exit
}
else if `"`key'"' == "08-q-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q1testingComputerProgram.csv", clear
  exit
}
else if `"`key'"' == "08-q-02" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q02ShadParasites.csv", clear
  exit
}
else if `"`key'"' == "08-q-03" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q03F2Resistance.csv", clear
  exit
}
else if `"`key'"' == "08-q-05" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q05WorldCup.csv", clear
  exit
}
else if `"`key'"' == "08-q-6" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q6CoinFlipping.csv", clear
  exit
}
else if `"`key'"' == "08-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q12SpiritBearGenetics.csv", clear
  exit
}
else if `"`key'"' == "08-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q14BirdWindowCrash.csv", clear
  exit
}
else if `"`key'"' == "08-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q14Cavalry.csv", clear
  exit
}
else if `"`key'"' == "08-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q16HospitalAdmission.csv", clear
  exit
}
else if `"`key'"' == "08-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q16Truffles.csv", clear
  exit
}
else if `"`key'"' == "08-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q18AnemonefishSexes.csv", clear
  exit
}
else if `"`key'"' == "08-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q19Hurricanes.csv", clear
  exit
}
else if `"`key'"' == "08-q-21" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q21FallingCatsByMonth.csv", clear
  exit
}
else if `"`key'"' == "08-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q24DodderGrowth.csv", clear
  exit
}
else if `"`key'"' == "08-q-25" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q25DodderWithPinene.csv", clear
  exit
}
else if `"`key'"' == "09-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e2AspirinCancer.csv", clear
  exit
}
else if `"`key'"' == "09-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e3ToxoplasmaAndAccidents.csv", clear
  exit
}
else if `"`key'"' == "09-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e3ParasiteBrainWarp.csv", clear
  exit
}
else if `"`key'"' == "09-e-4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e4VampireBites.csv", clear
  exit
}
else if `"`key'"' == "09-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q01CoffeeAndCancer.csv", clear
  exit
}
else if `"`key'"' == "09-q-02" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q02DiseaseAndDivorce.csv", clear
  exit
}
else if `"`key'"' == "09-q-04" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q04PigeonRumps.csv", clear
  exit
}
else if `"`key'"' == "09-q-05" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q05MalariaAndMosquitoFeeding.csv", clear
  exit
}
else if `"`key'"' == "09-q-06" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q06RedbackSpiderCannibalism.csv", clear
  exit
}
else if `"`key'"' == "09-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q07FrogsFire.csv", clear
  exit
}
else if `"`key'"' == "09-q-08" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q08FishSexChange.csv", clear
  exit
}
else if `"`key'"' == "09-q-09" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q09TVAndAggression.csv", clear
  exit
}
else if `"`key'"' == "09-q-10" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q10AlcoholHeartAttacks.csv", clear
  exit
}
else if `"`key'"' == "09-q-11" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q11PostnatalDepression.csv", clear
  exit
}
else if `"`key'"' == "09-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q12MigraineShunts.csv", clear
  exit
}
else if `"`key'"' == "09-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q14MedDiet.csv", clear
  exit
}
else if `"`key'"' == "09-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q16PrairieDogMultipleMating.csv", clear
  exit
}
else if `"`key'"' == "09-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q17LyingIntuition.csv", clear
  exit
}
else if `"`key'"' == "09-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q19Yawning.csv", clear
  exit
}
else if `"`key'"' == "09-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q20ALLDaycare.csv", clear
  exit
}
else if `"`key'"' == "09-q-21" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q21BlueTermites.csv", clear
  exit
}
else if `"`key'"' == "09-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q22SelfRecognition.csv", clear
  exit
}
else if `"`key'"' == "09-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q24HeatSterility.csv", clear
  exit
}
else if `"`key'"' == "09-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q26Because.csv", clear
  exit
}
else if `"`key'"' == "09-q-27" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q27WidowHealth.csv", clear
  exit
}
else if `"`key'"' == "09-q-29" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q29Denomination.csv", clear
  exit
}
else if `"`key'"' == "09-q-30" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q30FirearmsSuicide.csv", clear
  exit
}
else if `"`key'"' == "09-q-31" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q31NectarSpurs.csv", clear
  exit
}
else if `"`key'"' == "09-q-33" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q33Kuru.csv", clear
  exit
}
else if `"`key'"' == "10-e-6" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter10/chap10e6DeathsSpanishFlu1918.csv", clear
  exit
}
else if `"`key'"' == "10-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter10/chap10q17TreeGrowthRate.csv", clear
  exit
}
else if `"`key'"' == "10-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter10/chap10q19HealthExpenditures.csv", clear
  exit
}
else if `"`key'"' == "11-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11e2Stalkies.csv", clear
  exit
}
else if `"`key'"' == "11-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11e3Temperature.csv", clear
  exit
}
else if `"`key'"' == "11-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q01RangeShiftsWithClimateChange.csv", clear
  exit
}
else if `"`key'"' == "11-q-06" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q06WolfTeeth.csv", clear
  exit
}
else if `"`key'"' == "11-q-13" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q13SyrupSwimming.csv", clear
  exit
}
else if `"`key'"' == "11-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q16DolphinsClockwise.csv", clear
  exit
}
else if `"`key'"' == "11-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q17KoalaBellows.csv", clear
  exit
}
else if `"`key'"' == "11-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q18SticklebackPreference.csv", clear
  exit
}
else if `"`key'"' == "11-q-21" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q21SoilLeadAndHurricanes.csv", clear
  exit
}
else if `"`key'"' == "11-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q22BloodLeadKatrina.csv", clear
  exit
}
else if `"`key'"' == "11-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q24WalkingInCircles.csv", clear
  exit
}
else if `"`key'"' == "11-q-25" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q25SlothEars.csv", clear
  exit
}
else if `"`key'"' == "12-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12e2BlackbirdTestosterone.csv", clear
  exit
}
else if `"`key'"' == "12-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12e3HornedLizards.csv", clear
  exit
}
else if `"`key'"' == "12-e-4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12e4ChinookWithBrookTrout.csv", clear
  exit
}
else if `"`key'"' == "12-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q01DeathAndTaxes.csv", clear
  exit
}
else if `"`key'"' == "12-q-6" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q6TestesSize.csv", clear
  exit
}
else if `"`key'"' == "12-q-09" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q09Cichlids.csv", clear
  exit
}
else if `"`key'"' == "12-q-10" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q10WillsPresidents.csv", clear
  exit
}
else if `"`key'"' == "12-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q12OstrichTemp.csv", clear
  exit
}
else if `"`key'"' == "12-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q14Iguanas.csv", clear
  exit
}
else if `"`key'"' == "12-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q16BeerAndMosquitoes.csv", clear
  exit
}
else if `"`key'"' == "12-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q17HIVAntibody.csv", clear
  exit
}
else if `"`key'"' == "12-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q18StalkieEyespan.csv", clear
  exit
}
else if `"`key'"' == "12-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q20ElectricFish.csv", clear
  exit
}
else if `"`key'"' == "12-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q24WeddellSeals.csv", clear
  exit
}
else if `"`key'"' == "12-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q26HyenaGiggles.csv", clear
  exit
}
else if `"`key'"' == "12-q-31" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q31RatReciprocity.csv", clear
  exit
}
else if `"`key'"' == "12-q-32" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q32BeerGlassShape.csv", clear
  exit
}
else if `"`key'"' == "12-q-33" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q33SpinocerebellarAtaxia.csv", clear
  exit
}
else if `"`key'"' == "13-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13e1MarineReserve.csv", clear
  exit
}
else if `"`key'"' == "13-e-4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13e4SexualConflict.csv", clear
  exit
}
else if `"`key'"' == "13-e-5" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13e5SagebrushCrickets.csv", clear
  exit
}
else if `"`key'"' == "13-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q01CountryHealthExpenditure.csv", clear
  exit
}
else if `"`key'"' == "13-q-02" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q02GoldeneyeParasitism.csv", clear
  exit
}
else if `"`key'"' == "13-q-03" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q03Recycling.csv", clear
  exit
}
else if `"`key'"' == "13-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q07SeedSet.csv", clear
  exit
}
else if `"`key'"' == "13-q-08" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q08Lions.csv", clear
  exit
}
else if `"`key'"' == "13-q-09" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q09Newts.csv", clear
  exit
}
else if `"`key'"' == "13-q-13" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q13WormSperm.csv", clear
  exit
}
else if `"`key'"' == "13-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q14Dioecy.csv", clear
  exit
}
else if `"`key'"' == "13-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q15Mosquitoes.csv", clear
  exit
}
else if `"`key'"' == "13-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q16BeetleAngiosperms.csv", clear
  exit
}
else if `"`key'"' == "13-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q18ZebraFinches.csv", clear
  exit
}
else if `"`key'"' == "13-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q19SportsVsBiology.csv", clear
  exit
}
else if `"`key'"' == "13-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv", clear
  exit
}
else if `"`key'"' == "13-q-21" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q21StressAndIncompatibleMates.csv", clear
  exit
}
else if `"`key'"' == "13-q-25" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q25Clearcuts.csv", clear
  exit
}
else if `"`key'"' == "13-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q26ZebraFinchBeaks.csv", clear
  exit
}
else if `"`key'"' == "13-q-27" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q27Vuvuzela.csv", clear
  exit
}
else if `"`key'"' == "19-q-28" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap19q28Pseudoscorpions.csv", clear
  exit
}
else if `"`key'"' == "13-q-29" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q29ArmyAntSilverfish.csv", clear
  exit
}
else if `"`key'"' == "13-q-30" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q30WolbachiaAndDengue.csv", clear
  exit
}
else if `"`key'"' == "13-q-32" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q32GutFloraAutoimmune.csv", clear
  exit
}
else if `"`key'"' == "15-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15e1KneesWhoSayNight.csv", clear
  exit
}
else if `"`key'"' == "15-e-6" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15e6WalkingStickFemurs.csv", clear
  exit
}
else if `"`key'"' == "15-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q01HoneybeeCaffeine.csv", clear
  exit
}
else if `"`key'"' == "15-q-03" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q03ExamGrades.csv", clear
  exit
}
else if `"`key'"' == "15-q-04" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q04PlantPopulationPersistence.csv", clear
  exit
}
else if `"`key'"' == "15-q-08" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q08DisordersAndGeneExpression.csv", clear
  exit
}
else if `"`key'"' == "15-q-11" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q11DungBeetleCondition.csv", clear
  exit
}
else if `"`key'"' == "15-q-13" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q13RicketsiellaColor.csv", clear
  exit
}
else if `"`key'"' == "15-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q14TsetseLearning.csv", clear
  exit
}
else if `"`key'"' == "15-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q15EelgrassGenotypes.csv", clear
  exit
}
else if `"`key'"' == "15-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q17DaphniaResistance.csv", clear
  exit
}
else if `"`key'"' == "15-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q20NematodeLifespan.csv", clear
  exit
}
else if `"`key'"' == "15-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q22WalkingStickHeads.csv", clear
  exit
}
else if `"`key'"' == "15-q-23" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q23LodgepolePineCones.csv", clear
  exit
}
else if `"`key'"' == "15-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q24LupusProneMice.csv", clear
  exit
}
else if `"`key'"' == "15-q-25" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q25LizardSprintSpeed.csv", clear
  exit
}
else if `"`key'"' == "15-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q26MalariaFungusVenom.csv", clear
  exit
}
else if `"`key'"' == "15-q-27" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q27NonsenseMathEffect.csv", clear
  exit
}
else if `"`key'"' == "15-q-28" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q28FlySelfMedication.csv", clear
  exit
}
else if `"`key'"' == "15-q-30" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q30FiddlerCrabFans.csv", clear
  exit
}
else if `"`key'"' == "15-q-32" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q32HippocampalVolumeRatio.csv", clear
  exit
}
else if `"`key'"' == "16-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16e1FlippingBird.csv", clear
  exit
}
else if `"`key'"' == "16-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16e2InbreedingWolves.csv", clear
  exit
}
else if `"`key'"' == "16-e-5" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16e5IndianRopeTrick.csv", clear
  exit
}
else if `"`key'"' == "16-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q01Hyena GigglesAndAge.csv", clear
  exit
}
else if `"`key'"' == "16-q-03" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q03TBResistance.csv", clear
  exit
}
else if `"`key'"' == "16-q-05" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q05GodwitArrivalDates.csv", clear
  exit
}
else if `"`key'"' == "16-q-10" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q10EarwigForceps.csv", clear
  exit
}
else if `"`key'"' == "16-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q12CricketImmunitySpermViability.csv", clear
  exit
}
else if `"`key'"' == "16-q-13" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q13LefthandednessAndViolence.csv", clear
  exit
}
else if `"`key'"' == "16-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q14TelomeresAndStress.csv", clear
  exit
}
else if `"`key'"' == "16-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q15LanguageGreyMatter.csv", clear
  exit
}
else if `"`key'"' == "16-q-16" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q16GreenSpaceBiodiversity.csv", clear
  exit
}
else if `"`key'"' == "16-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q18SalmonSalmonberries.csv", clear
  exit
}
else if `"`key'"' == "16-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q19LiverPreparation.csv", clear
  exit
}
else if `"`key'"' == "16-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q20SleepAndPerformance.csv", clear
  exit
}
else if `"`key'"' == "16-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q22TrilliumRecruitment.csv", clear
  exit
}
else if `"`key'"' == "16-q-23" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q23CocaineHigh.csv", clear
  exit
}
else if `"`key'"' == "16-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q24ExtroversionNeuroticism.csv", clear
  exit
}
else if `"`key'"' == "16-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q26ChocolateAndNobel.csv", clear
  exit
}
else if `"`key'"' == "16-q-27" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q27AntibodyTumorScreening.csv", clear
  exit
}
else if `"`key'"' == "17-e-1" {
  import delimited "https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17e1LionNoses.csv", clear
  exit
}
else if `"`key'"' == "17-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17e3PlantDiversityAndStability.csv", clear
  exit
}
else if `"`key'"' == "17-e-8" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17e8ShrinkingSeals.csv", clear
  exit
}
else if `"`key'"' == "17-f-5_2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f5_2JuncoOutlier.csv", clear
  exit
}
else if `"`key'"' == "17-f-5_3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f5_3DesertPoolFish.csv", clear
  exit
}
else if `"`key'"' == "17-f-5_4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f5_4BlueTitCapColor.csv", clear
  exit
}
else if `"`key'"' == "17-f-5_4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f5_4CockroachNeurons.csv", clear
  exit
}
else if `"`key'"' == "17-f-6_3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f6_3IrisPollination.csv", clear
  exit
}
else if `"`key'"' == "17-f-8_1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f8_1IronAndPhytoplanktonGrowth.csv", clear
  exit
}
else if `"`key'"' == "17-f-8_2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f8_2PondPlantsAndProductivity.csv", clear
  exit
}
else if `"`key'"' == "17-f-9_1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f9_1GuppyColdDeath.csv", clear
  exit
}
else if `"`key'"' == "17-q-01" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q01FacesAndPenalties.csv", clear
  exit
}
else if `"`key'"' == "17-q-06" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q06ZooMortality.csv", clear
  exit
}
else if `"`key'"' == "17-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q07ProgesteroneExercise.csv", clear
  exit
}
else if `"`key'"' == "17-q-10" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q10HybridPollenSterility.csv", clear
  exit
}
else if `"`key'"' == "17-q-11" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q11RattlesnakeDigestion.csv", clear
  exit
}
else if `"`key'"' == "17-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q12LizardBite.csv", clear
  exit
}
else if `"`key'"' == "17-q-14" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q14HypoxanthineTimeOfDeath.csv", clear
  exit
}
else if `"`key'"' == "17-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q15SocialSpiderColonies.csv", clear
  exit
}
else if `"`key'"' == "17-q-17" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q17EarthwormsAndNitrogen.csv", clear
  exit
}
else if `"`key'"' == "17-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q18CypressRespiration.csv", clear
  exit
}
else if `"`key'"' == "17-q-19" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q19GrasslandNutrientsPlantSpecies.csv", clear
  exit
}
else if `"`key'"' == "17-q-20" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q20PrimateMassMetabolicRate.csv", clear
  exit
}
else if `"`key'"' == "17-q-22" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q22FlycatcherPatch.csv", clear
  exit
}
else if `"`key'"' == "17-q-23" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q23TreeSeedlingsAndSunflecks.csv", clear
  exit
}
else if `"`key'"' == "17-q-24" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q24PenguinTreadmill.csv", clear
  exit
}
else if `"`key'"' == "17-q-25" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q25BeetleWingsAndHorns.csv", clear
  exit
}
else if `"`key'"' == "17-q-26" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q26SongExtinctKatydid.csv", clear
  exit
}
else if `"`key'"' == "17-q-27" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q27DaphniaParasiteLongevity.csv", clear
  exit
}
else if `"`key'"' == "17-q-28" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q28BrainMetabolism.csv", clear
  exit
}
else if `"`key'"' == "17-q-29" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q29DEETMosquiteBites.csv", clear
  exit
}
else if `"`key'"' == "17-q-30" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q30NuclearTeeth.csv", clear
  exit
}
else if `"`key'"' == "17-q-31" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q31LastSupperPortionSize.csv", clear
  exit
}
else if `"`key'"' == "17-q-32" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q32CoralSnakeMimics.csv", clear
  exit
}
else if `"`key'"' == "17-q-33" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q33EggLayingMismatch.csv", clear
  exit
}
else if `"`key'"' == "17-q-34" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q34FatherAgeMutations.csv", clear
  exit
}
else if `"`key'"' == "17-q-35" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q35AnthraxMortality.csv", clear
  exit
}
else if `"`key'"' == "17-q-36" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q36StorkStress.csv", clear
  exit
}
else if `"`key'"' == "18-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18e2ZooplanktonDepredation.csv", clear
  exit
}
else if `"`key'"' == "18-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18e3IntertidalAlgae.csv", clear
  exit
}
else if `"`key'"' == "18-e-4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18e4MoleRatLayabouts.csv", clear
  exit
}
else if `"`key'"' == "18-q-06" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q06HippocampusLesions.csv", clear
  exit
}
else if `"`key'"' == "18-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q07flyLifeSpan.csv", clear
  exit
}
else if `"`key'"' == "18-q-08" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q08BeeGeneExpression.csv", clear
  exit
}
else if `"`key'"' == "18-q-11" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q11MouseEmpathy.csv", clear
  exit
}
else if `"`key'"' == "18-q-12" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q12NeanderthalBrainSize.csv", clear
  exit
}
else if `"`key'"' == "18-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q15ExploitedLarvalFish.csv", clear
  exit
}
else if `"`key'"' == "18-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q18OpsinExpression.csv", clear
  exit
}
else if `"`key'"' == "19-e-1" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19e1TwoDigitNumbers.csv", clear
  exit
}
else if `"`key'"' == "19-e-2" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19e2ChimpBrains.csv", clear
  exit
}
else if `"`key'"' == "19-q-11" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19q11LoveDarts.csv", clear
  exit
}
else if `"`key'"' == "19-q-13" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19q13BacteriaPerLeaf.csv", clear
  exit
}
else if `"`key'"' == "19-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19q15SpeedOfLight.csv", clear
  exit
}
else if `"`key'"' == "20-e-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter20/chap20e3UnrulyPassengers.csv", clear
  exit
}
else if `"`key'"' == "20-e-4" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter20/chap20e4ConservationScoop.csv", clear
  exit
}
else if `"`key'"' == "20-q-07" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter20/chap20q07YeastRegulatoryGenes.csv", clear
  exit
}
else if `"`key'"' == "20-q-08" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter20/chap20q08SilverswordWaitingTimes.csv", clear
  exit
}
else if `"`key'"' == "20-q-15" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter20/chap20q15VoleDispersal.csv", clear
  exit
}
else if `"`key'"' == "20-q-18" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter20/chap20q18BeeLifespans.csv", clear
  exit
}
else if `"`key'"' == "21-p-3" {
  import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter21/selection.csv", clear
  exit
}
else if `"`key'"' == "abm" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/abm.dta", clear
  exit
}
else if `"`key'"' == "acath" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/acath.dta", clear
  exit
}
else if `"`key'"' == "birth_estriol" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/birth_estriol.csv", clear
  exit
}
else if `"`key'"' == "cdystonia" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/cdystonia.dta", clear
  exit
}
else if `"`key'"' == "diabetes"{
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/diabetes.csv", clear
  exit
}
else if `"`key'"' == "dmd" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/dmd.csv", clear
  exit
}
else if `"`key'"' == "esopH" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/esopH.dta", clear
  exit
}
else if `"`key'"' == "FEV" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/FEV.csv", clear
  exit
}
else if `"`key'"' == "lead" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/lead.dta", clear
  exit
}
else if `"`key'"' == "nhgh" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/nhgh.dta", clear
  exit
}
else if `"`key'"' == "pbc" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/pbc.dta", clear
  exit
}
else if `"`key'"' == "prostate" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/prostate.dta", clear
  exit
}
else if `"`key'"' == "rhc" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/rhc.csv", clear
  exit
}
else if `"`key'"' == "sex.age.response" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/sex.age.response.dta", clear
  exit
}
else if `"`key'"' == "stressEcho" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/stressEcho.csv", clear
  exit
}
else if `"`key'"' == "support" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/support.dta", clear
  exit
}
else if `"`key'"' == "titanic3" {
  use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.dta", clear
  exit
}
else if `"`key'"' == "valung" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/valung.csv", clear
  exit
}
else if `"`key'"' == "1.3.2.Sepsis" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/1.3.2.Sepsis.csv", clear
  exit
}
else if `"`key'"' == "1.4.11.Sepsis" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/1.4.11.Sepsis.csv", clear
  exit
}
else if `"`key'"' == "10.7.ERpolymorphism" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/10.7.ERpolymorphism.csv", clear
  exit
}
else if `"`key'"' == "11.2.Isoproterenol" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.2.Isoproterenol.csv", clear
  exit
}
else if `"`key'"' == "11.2.Long.Isoproterenol" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.2.Long.Isoproterenol.csv", clear
  exit
}
else if `"`key'"' == "11.AreaUnderCurve" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.AreaUnderCurve.csv", clear
  exit
}
else if `"`key'"' == "2.12.Poisson" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.12.Poisson.csv", clear
  exit
}
else if `"`key'"' == "2.18.Funding" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.18.Funding.csv", clear
  exit
}
else if `"`key'"' == "2.20.Framingham" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.20.Framingham.csv", clear
  exit
}
else if `"`key'"' == "2.ex.vonHippelLindau" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.ex.vonHippelLindau.csv", clear
  exit
}
else if `"`key'"' == "3.ex.Funding" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/3.ex.Funding.csv", clear
  exit
}
else if `"`key'"' == "4.11.Sepsis" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.11.Sepsis.csv", clear
  exit
}
else if `"`key'"' == "4.18.Sepsis" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.18.Sepsis.csv", clear
  exit
}
else if `"`key'"' == "4.21.EsophagealCa" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.21.EsophagealCa.csv", clear
  exit
}
else if `"`key'"' == "4.ex.Sepsis" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.ex.Sepsis.csv", clear
  exit
}
else if `"`key'"' == "5.5.EsophagealCa" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/5.5.EsophagealCa.csv", clear
  exit
}
else if `"`key'"' == "5.ex.InjuryDeath" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/5.ex.InjuryDeath.csv", clear
  exit
}
else if `"`key'"' == "6.9.Hemorrhage" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/6.9.Hemorrhage.csv", clear
  exit
}
else if `"`key'"' == "6.ex.Breast" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/6.ex.Breast.csv", clear
  exit
}
else if `"`key'"' == "8.12.Framingham" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.12.Framingham.csv", clear
  exit
}
else if `"`key'"' == "8.7.Framingham" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.7.Framingham.csv", clear
  exit
}
else if `"`key'"' == "8.8.2.Person-Years" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.8.2.Person-Years.csv", clear
  exit
}
else if `"`key'"' == "8.8.2.Survival" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.8.2.Survival.csv", clear
  exit
}
else if `"`key'"' == "8.ex.InjuryDeath" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.ex.InjuryDeath.csv", clear
  exit
}
else if `"`key'"' == "11.ex.Sepsis" {
  import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.ex.Sepsis.csv", clear
  exit
}
else if `"`key'"' == "sat" {
  import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/MsciBiostatIIAssignments/sat.csv", clear
  exit
}
else if `"`key'"' == "key"{
  display "abm, acath, birth_estriol, cdystonia, diabetes, dmd, esopH, FEV, lead, nhgh, pbc, prostate, rhc, sex.age.response, stressEcho, support, titanic3, valung, 1.3.2.Sepsis, 1.4.11.Sepsis, 10.7.ERpolymorphism, 11.2.Isoproterenol, 11.2.Long.Isoproterenol, 11.AreaUnderCurve, 2.12.Poisson, 2.18.Funding, 2.20.Framingham, 2.ex.vonHippelLindau, 3.ex.Funding, 4.11.Sepsis, 4.18.Sepsis, 4.21.EsophagealCa, 4.ex.Sepsis, 5.5.EsophagealCa, 5.ex.InjuryDeath, 6.9.Hemorrhage, 6.ex.Breast, 8.12.Framingham, 8.7.Framingham, 8.8.2.Person-Years, 8.8.2.Survival, 8.ex.InjuryDeath, 11.ex.Sepsis"
}
else {
  display "Dataset not found.  Use 'getvdata' to see list of available datasets."
}
end
