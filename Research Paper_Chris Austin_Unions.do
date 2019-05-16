************* WWS582b PS1 *************
*  Spring 2019			              *
*  Author : Chris Austin              *
*  Email: chris.austin@princeton.edu  *
***************************************

/* Last modified by: Chris Austin
Last modified on: 5/14/19 */

clear all

set maxvar 32000
set more off
set matsize 10000
capture log close
ssc install blindschemes, replace all
set scheme plotplain, permanently
ssc install pshare
ssc install synth

pause on

*Set directory, dta file, etc.
cd "C:\Users\Chris\Documents\Princeton\WWS Spring 2019\Economic Causes and Conesequences of Inequality\Research Paper\Stata"

{
quietly infix                   ///
int     year         1-4      ///
  long    serial       5-9      ///
  byte    month        10-11    ///
  double  cpsid        12-25    ///
  byte    asecflag     26-26    ///
  byte    hflag        27-27    ///
  double  asecwth      28-37    ///
  byte    statefip     38-39    ///
  long    county       40-44    ///
  byte    statecensus  45-46    ///
  byte    ownershp     47-48    ///
  double  hhincome     49-56    ///
  byte    ncouples     57-57    ///
  byte    pernum       58-59    ///
  double  cpsidp       60-73    ///
  double  asecwt       74-83    ///
  int     relate       84-87    ///
  byte    age          88-89    ///
  byte    sex          90-90    ///
  int     race         91-93    ///
  byte    sprule       94-95    ///
  byte    famunit      96-97    ///
  byte    ftype        98-98    ///
  long    bpl          99-103   ///
  byte    citizen      104-104  ///
  byte    empstat      105-106  ///
  byte    labforce     107-107  ///
  int     occ          108-111  ///
  int     ind          112-115  ///
  byte    classwkr     116-117  ///
  int     uhrsworkt    118-120  ///
  byte    whyunemp     121-121  ///
  byte    whyabsnt     122-123  ///
  int     whyptlwk     124-126  ///
  byte    wkstat       127-128  ///
  int     educ         129-131  ///
  double  earnwt       132-141  ///
  int     uhrsworkly   142-144  ///
  byte    pension      145-145  ///
  byte    firmsize     146-146  ///
  double  ftotval      147-156  ///
  double  inctot       157-164  ///
  long    incwage      165-171  ///
  long    incss        172-176  ///
  long    incwelfr     177-181  ///
  long    incssi       182-186  ///
  long    incdisab     187-192  ///
  byte    srcdisa2     193-194  ///
  byte    srcreti1     195-195  ///
  byte    srcreti2     196-196  ///
  byte    whyss1       197-197  ///
  byte    whyss2       198-198  ///
  byte    offpov       199-200  ///
  byte    offpovuniv   201-202  ///
  byte    disabwrk     203-203  ///
  byte    health       204-204  ///
  byte    quitsick     205-205  ///
  byte    inclugh      206-206  ///
  byte    paidgh       207-208  ///
  int     emcontrb     209-212  ///
  byte    himcaid      213-213  ///
  byte    gotwic       214-214  ///
  double  hourwage     215-218  ///
  byte    union        219-219  ///
  using `"cps_001.dat"'

replace asecwth     = asecwth     / 10000
replace asecwt      = asecwt      / 10000
replace earnwt      = earnwt      / 10000
replace hourwage    = hourwage    / 100

format cpsid       %14.0g
format asecwth     %10.4f
format hhincome    %8.0g
format cpsidp      %14.0g
format asecwt      %10.4f
format earnwt      %10.4f
format ftotval     %10.0g
format inctot      %8.0g
format hourwage    %4.2f

label var year        `"Survey year"'
label var serial      `"Household serial number"'
label var month       `"Month"'
label var cpsid       `"CPSID, household record"'
label var asecflag    `"Flag for ASEC"'
label var hflag       `"Flag for the 3/8 file 2014"'
label var asecwth     `"Annual Social and Economic Supplement Household weight"'
label var statefip    `"State (FIPS code)"'
label var county      `"FIPS county code"'
label var statecensus `"State (Census code)"'
label var ownershp    `"Ownership of dwelling"'
label var hhincome    `"Total household income"'
label var ncouples    `"Number of married couples in household"'
label var pernum      `"Person number in sample unit"'
label var cpsidp      `"CPSID, person record"'
label var asecwt      `"Annual Social and Economic Supplement Weight"'
label var relate      `"Relationship to household head"'
label var age         `"Age"'
label var sex         `"Sex"'
label var race        `"Race"'
label var sprule      `"Rule for linking spouse"'
label var famunit     `"Family unit membership"'
label var ftype       `"Family Type"'
label var bpl         `"Birthplace"'
label var citizen     `"Citizenship status"'
label var empstat     `"Employment status"'
label var labforce    `"Labor force status"'
label var occ         `"Occupation"'
label var ind         `"Industry"'
label var classwkr    `"Class of worker"'
label var uhrsworkt   `"Hours usually worked per week at all jobs"'
label var whyunemp    `"Reason for unemployment"'
label var whyabsnt    `"Reason for absence from work"'
label var whyptlwk    `"Reason for working part time last week"'
label var wkstat      `"Full or part time status"'
label var educ        `"Educational attainment recode"'
label var earnwt      `"Earnings weight"'
label var uhrsworkly  `"Usual hours worked per week (last yr)"'
label var pension     `"Pension plan at work"'
label var firmsize    `"Number of employees"'
label var ftotval     `"Total family income"'
label var inctot      `"Total personal income"'
label var incwage     `"Wage and salary income"'
label var incss       `"Social Security income"'
label var incwelfr    `"Welfare (public assistance) income"'
label var incssi      `"Income from SSI"'
label var incdisab    `"Income from disability benefits"'
label var srcdisa2    `"Second source of disability income"'
label var srcreti1    `"First source of retirement income"'
label var srcreti2    `"Second source of retirement income"'
label var whyss1      `"First reason for receiving social security income"'
label var whyss2      `"Second reason for receiving social security income"'
label var offpov      `"Official Poverty Status (IPUMS constructed)"'
label var offpovuniv  `"Official Poverty Rate Universe"'
label var disabwrk    `"Work disability"'
label var health      `"Health status"'
label var quitsick    `"Quit job or retired for health reasons"'
label var inclugh     `"Included in employer group health plan  last year"'
label var paidgh      `"Employer paid for group health plan"'
label var emcontrb    `"Employer contribution for health insurance"'
label var himcaid     `"Covered by Medicaid last year"'
label var gotwic      `"Received WIC"'
label var hourwage    `"Hourly wage"'
label var union       `"Union membership"'

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define asecflag_lbl 1 `"ASEC"'
label define asecflag_lbl 2 `"March Basic"', add
label values asecflag asecflag_lbl

label define hflag_lbl 0 `"5/8 file"'
label define hflag_lbl 1 `"3/8 file"', add
label values hflag hflag_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 69 `"Nebraska-North Dakota-South Dakota"', add
label define statefip_lbl 70 `"Maine-Massachusetts-New Hampshire-Rhode Island-Vermont"', add
label define statefip_lbl 71 `"Michigan-Wisconsin"', add
label define statefip_lbl 72 `"Minnesota-Iowa"', add
label define statefip_lbl 73 `"Nebraska-North Dakota-South Dakota-Kansas"', add
label define statefip_lbl 74 `"Delaware-Virginia"', add
label define statefip_lbl 75 `"North Carolina-South Carolina"', add
label define statefip_lbl 76 `"Alabama-Mississippi"', add
label define statefip_lbl 77 `"Arkansas-Oklahoma"', add
label define statefip_lbl 78 `"Arizona-New Mexico-Colorado"', add
label define statefip_lbl 79 `"Idaho-Wyoming-Utah-Montana-Nevada"', add
label define statefip_lbl 80 `"Alaska-Washington-Hawaii"', add
label define statefip_lbl 81 `"New Hampshire-Maine-Vermont-Rhode Island"', add
label define statefip_lbl 83 `"South Carolina-Georgia"', add
label define statefip_lbl 84 `"Kentucky-Tennessee"', add
label define statefip_lbl 85 `"Arkansas-Louisiana-Oklahoma"', add
label define statefip_lbl 87 `"Iowa-N Dakota-S Dakota-Nebraska-Kansas-Minnesota-Missouri"', add
label define statefip_lbl 88 `"Washington-Oregon-Alaska-Hawaii"', add
label define statefip_lbl 89 `"Montana-Wyoming-Colorado-New Mexico-Utah-Nevada-Arizona"', add
label define statefip_lbl 90 `"Delaware-Maryland-Virginia-West Virginia"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define statecensus_lbl 00 `"Unknown"'
label define statecensus_lbl 11 `"Maine"', add
label define statecensus_lbl 12 `"New Hampshire"', add
label define statecensus_lbl 13 `"Vermont"', add
label define statecensus_lbl 14 `"Massachusetts"', add
label define statecensus_lbl 15 `"Rhode Island"', add
label define statecensus_lbl 16 `"Connecticut"', add
label define statecensus_lbl 19 `"Maine, New Hampshire, Vermont, Rhode Island"', add
label define statecensus_lbl 21 `"New York"', add
label define statecensus_lbl 22 `"New Jersey"', add
label define statecensus_lbl 23 `"Pennsylvania"', add
label define statecensus_lbl 31 `"Ohio"', add
label define statecensus_lbl 32 `"Indiana"', add
label define statecensus_lbl 33 `"Illinois"', add
label define statecensus_lbl 34 `"Michigan"', add
label define statecensus_lbl 35 `"Wisconsin"', add
label define statecensus_lbl 39 `"Michigan, Wisconsin"', add
label define statecensus_lbl 41 `"Minnesota"', add
label define statecensus_lbl 42 `"Iowa"', add
label define statecensus_lbl 43 `"Missouri"', add
label define statecensus_lbl 44 `"North Dakota"', add
label define statecensus_lbl 45 `"South Dakota"', add
label define statecensus_lbl 46 `"Nebraska"', add
label define statecensus_lbl 47 `"Kansas"', add
label define statecensus_lbl 49 `"Minnesota, Iowa, Missouri, North Dakota, South Dakota, Nebraska, Kansas"', add
label define statecensus_lbl 50 `"Delaware, Maryland, Virginia, West Virginia"', add
label define statecensus_lbl 51 `"Delaware"', add
label define statecensus_lbl 52 `"Maryland"', add
label define statecensus_lbl 53 `"District of Columbia"', add
label define statecensus_lbl 54 `"Virginia"', add
label define statecensus_lbl 55 `"West Virginia"', add
label define statecensus_lbl 56 `"North Carolina"', add
label define statecensus_lbl 57 `"South Carolina"', add
label define statecensus_lbl 58 `"Georgia"', add
label define statecensus_lbl 59 `"Florida"', add
label define statecensus_lbl 60 `"South Carolina, Georgia"', add
label define statecensus_lbl 61 `"Kentucky"', add
label define statecensus_lbl 62 `"Tennessee"', add
label define statecensus_lbl 63 `"Alabama"', add
label define statecensus_lbl 64 `"Mississippi"', add
label define statecensus_lbl 67 `"Kentucky, Tennessee"', add
label define statecensus_lbl 69 `"Alabama, Mississippi"', add
label define statecensus_lbl 71 `"Arkansas"', add
label define statecensus_lbl 72 `"Louisiana"', add
label define statecensus_lbl 73 `"Oklahoma"', add
label define statecensus_lbl 74 `"Texas"', add
label define statecensus_lbl 79 `"Arkansas, Louisiana, Oklahoma"', add
label define statecensus_lbl 81 `"Montana"', add
label define statecensus_lbl 82 `"Idaho"', add
label define statecensus_lbl 83 `"Wyoming"', add
label define statecensus_lbl 84 `"Colorado"', add
label define statecensus_lbl 85 `"New Mexico"', add
label define statecensus_lbl 86 `"Arizona"', add
label define statecensus_lbl 87 `"Utah"', add
label define statecensus_lbl 88 `"Nevada"', add
label define statecensus_lbl 89 `"Montana, Idaho, Wyoming, Colorado, New Mexico, Arizona, Utah, Nevada"', add
label define statecensus_lbl 91 `"Washington"', add
label define statecensus_lbl 92 `"Oregon"', add
label define statecensus_lbl 93 `"California"', add
label define statecensus_lbl 94 `"Alaska"', add
label define statecensus_lbl 95 `"Hawaii"', add
label define statecensus_lbl 99 `"Washington, Oregon, Alaska, Hawaii"', add
label values statecensus statecensus_lbl

label define ownershp_lbl 00 `"NIU"'
label define ownershp_lbl 10 `"Owned or being bought"', add
label define ownershp_lbl 21 `"No cash rent"', add
label define ownershp_lbl 22 `"With cash rent"', add
label values ownershp ownershp_lbl

label define ncouples_lbl 0 `"0 couples or NIU"'
label define ncouples_lbl 1 `"1"', add
label define ncouples_lbl 2 `"2"', add
label define ncouples_lbl 3 `"3"', add
label define ncouples_lbl 4 `"4"', add
label define ncouples_lbl 5 `"5"', add
label define ncouples_lbl 6 `"6"', add
label define ncouples_lbl 7 `"7"', add
label define ncouples_lbl 9 `"9"', add
label values ncouples ncouples_lbl

label define relate_lbl 0101 `"Head/householder"'
label define relate_lbl 0201 `"Spouse"', add
label define relate_lbl 0301 `"Child"', add
label define relate_lbl 0303 `"Stepchild"', add
label define relate_lbl 0501 `"Parent"', add
label define relate_lbl 0701 `"Sibling"', add
label define relate_lbl 0901 `"Grandchild"', add
label define relate_lbl 1001 `"Other relatives, n.s."', add
label define relate_lbl 1113 `"Partner/roommate"', add
label define relate_lbl 1114 `"Unmarried partner"', add
label define relate_lbl 1115 `"Housemate/roomate"', add
label define relate_lbl 1241 `"Roomer/boarder/lodger"', add
label define relate_lbl 1242 `"Foster children"', add
label define relate_lbl 1260 `"Other nonrelatives"', add
label define relate_lbl 9100 `"Armed Forces, relationship unknown"', add
label define relate_lbl 9200 `"Age under 14, relationship unknown"', add
label define relate_lbl 9900 `"Relationship unknown"', add
label define relate_lbl 9999 `"NIU"', add
label values relate relate_lbl

label define age_lbl 00 `"Under 1 year"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"NIU"', add
label values sex sex_lbl

label define race_lbl 100 `"White"'
label define race_lbl 200 `"Black/Negro"', add
label define race_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_lbl 650 `"Asian or Pacific Islander"', add
label define race_lbl 651 `"Asian only"', add
label define race_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_lbl 700 `"Other (single) race, n.e.c."', add
label define race_lbl 801 `"White-Black"', add
label define race_lbl 802 `"White-American Indian"', add
label define race_lbl 803 `"White-Asian"', add
label define race_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_lbl 805 `"Black-American Indian"', add
label define race_lbl 806 `"Black-Asian"', add
label define race_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_lbl 808 `"American Indian-Asian"', add
label define race_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 810 `"White-Black-American Indian"', add
label define race_lbl 811 `"White-Black-Asian"', add
label define race_lbl 812 `"White-American Indian-Asian"', add
label define race_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_lbl 815 `"American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 816 `"White-Black--Hawaiian/Pacific Islander"', add
label define race_lbl 817 `"White-American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 818 `"Black-American Indian-Asian"', add
label define race_lbl 819 `"White-American Indian-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 820 `"Two or three races, unspecified"', add
label define race_lbl 830 `"Four or five races, unspecified"', add
label define race_lbl 999 `"Blank"', add
label values race race_lbl

label define sprule_lbl 00 `"No spouse link"'
label define sprule_lbl 11 `"Rule 11 is used to identify spouse/partner"', add
label define sprule_lbl 12 `"Rule 12 is used to identify spouse/partner"', add
label define sprule_lbl 13 `"Rule 13 is used to identify spouse/partner"', add
label define sprule_lbl 14 `"Rule 14 is used to identify spouse/partner"', add
label define sprule_lbl 15 `"Rule 15 is used to identify spouse/partner"', add
label define sprule_lbl 16 `"Rule 16 is used to identify spouse/partner"', add
label define sprule_lbl 21 `"Rule 21 is used to identify spouse/partner"', add
label define sprule_lbl 22 `"Rule 22 is used to identify spouse/partner"', add
label define sprule_lbl 23 `"Rule 23 is used to identify spouse/partner"', add
label define sprule_lbl 24 `"Rule 24 is used to identify spouse/partner"', add
label define sprule_lbl 25 `"Rule 25 is used to identify spouse/partner"', add
label define sprule_lbl 26 `"Rule 26 is used to identify spouse/partner"', add
label define sprule_lbl 31 `"Rule 31 is used to identify spouse/partner"', add
label define sprule_lbl 32 `"Rule 32 is used to identify spouse/partner"', add
label define sprule_lbl 33 `"Rule 33 is used to identify spouse/partner"', add
label define sprule_lbl 34 `"Rule 34 is used to identify spouse/partner"', add
label define sprule_lbl 35 `"Rule 35 is used to identify spouse/partner"', add
label define sprule_lbl 36 `"Rule 36 is used to identify spouse/partner"', add
label define sprule_lbl 41 `"Rule 41 is used to identify spouse/partner"', add
label define sprule_lbl 42 `"Rule 42 is used to identify spouse/partner"', add
label define sprule_lbl 43 `"Rule 43 is used to identify spouse/partner"', add
label define sprule_lbl 44 `"Rule 44 is used to identify spouse/partner"', add
label define sprule_lbl 45 `"Rule 45 is used to identify spouse/partner"', add
label define sprule_lbl 46 `"Rule 46 is used to identify spouse/partner"', add
label values sprule sprule_lbl

label define famunit_lbl 01 `"1st family in household or group quarters"'
label define famunit_lbl 02 `"2nd family in household or group quarters"', add
label define famunit_lbl 03 `"3rd"', add
label define famunit_lbl 04 `"4th"', add
label define famunit_lbl 05 `"5th"', add
label define famunit_lbl 06 `"6th"', add
label define famunit_lbl 07 `"7th"', add
label define famunit_lbl 08 `"8th"', add
label define famunit_lbl 09 `"9th"', add
label define famunit_lbl 10 `"10"', add
label define famunit_lbl 11 `"11"', add
label define famunit_lbl 12 `"12"', add
label define famunit_lbl 13 `"13"', add
label define famunit_lbl 14 `"14"', add
label define famunit_lbl 15 `"15"', add
label define famunit_lbl 16 `"16"', add
label define famunit_lbl 17 `"17"', add
label define famunit_lbl 18 `"18"', add
label define famunit_lbl 19 `"19"', add
label define famunit_lbl 20 `"20"', add
label define famunit_lbl 21 `"21"', add
label define famunit_lbl 22 `"22"', add
label define famunit_lbl 23 `"23"', add
label define famunit_lbl 24 `"24"', add
label define famunit_lbl 25 `"25"', add
label define famunit_lbl 26 `"26"', add
label define famunit_lbl 27 `"27"', add
label define famunit_lbl 28 `"28"', add
label define famunit_lbl 29 `"29"', add
label values famunit famunit_lbl

label define ftype_lbl 1 `"Primary family"'
label define ftype_lbl 2 `"Nonfamily householder"', add
label define ftype_lbl 3 `"Related subfamily"', add
label define ftype_lbl 4 `"Unrelated subfamily"', add
label define ftype_lbl 5 `"Secondary individual"', add
label define ftype_lbl 9 `"Missing"', add
label values ftype ftype_lbl

label define bpl_lbl 09900 `"United States, n.s."'
label define bpl_lbl 10000 `"American Samoa"', add
label define bpl_lbl 10500 `"Guam"', add
label define bpl_lbl 10750 `"Northern Mariana Islands"', add
label define bpl_lbl 11000 `"Puerto Rico"', add
label define bpl_lbl 11500 `"U.S. Virgin Islands"', add
label define bpl_lbl 12090 `"U.S. outlying areas, n.s."', add
label define bpl_lbl 15000 `"Canada"', add
label define bpl_lbl 16010 `"Bermuda"', add
label define bpl_lbl 19900 `"North America, n.s."', add
label define bpl_lbl 20000 `"Mexico"', add
label define bpl_lbl 21010 `"Belize/British Honduras"', add
label define bpl_lbl 21020 `"Costa Rica"', add
label define bpl_lbl 21030 `"El Salvador"', add
label define bpl_lbl 21040 `"Guatemala"', add
label define bpl_lbl 21050 `"Honduras"', add
label define bpl_lbl 21060 `"Nicaragua"', add
label define bpl_lbl 21070 `"Panama"', add
label define bpl_lbl 21090 `"Central America, n.s."', add
label define bpl_lbl 25000 `"Cuba"', add
label define bpl_lbl 26010 `"Dominican Republic"', add
label define bpl_lbl 26020 `"Haiti"', add
label define bpl_lbl 26030 `"Jamaica"', add
label define bpl_lbl 26043 `"Bahamas"', add
label define bpl_lbl 26044 `"Barbados"', add
label define bpl_lbl 26054 `"Dominica"', add
label define bpl_lbl 26055 `"Grenada"', add
label define bpl_lbl 26060 `"Trinidad and Tobago"', add
label define bpl_lbl 26065 `"Antigua and Barbuda"', add
label define bpl_lbl 26070 `"St. Kitts--Nevis"', add
label define bpl_lbl 26075 `"St. Lucia"', add
label define bpl_lbl 26080 `"St. Vincent and the Grenadi"', add
label define bpl_lbl 26091 `"Caribbean, n.s."', add
label define bpl_lbl 30005 `"Argentina"', add
label define bpl_lbl 30010 `"Bolivia"', add
label define bpl_lbl 30015 `"Brazil"', add
label define bpl_lbl 30020 `"Chile"', add
label define bpl_lbl 30025 `"Colombia"', add
label define bpl_lbl 30030 `"Ecuador"', add
label define bpl_lbl 30040 `"Guyana/British Guiana"', add
label define bpl_lbl 30050 `"Peru"', add
label define bpl_lbl 30060 `"Uruguay"', add
label define bpl_lbl 30065 `"Venezuela"', add
label define bpl_lbl 30070 `"Paraguay"', add
label define bpl_lbl 30090 `"South America, n.s."', add
label define bpl_lbl 31000 `"Americas, n.s."', add
label define bpl_lbl 40000 `"Denmark"', add
label define bpl_lbl 40100 `"Finland"', add
label define bpl_lbl 40200 `"Iceland"', add
label define bpl_lbl 40400 `"Norway"', add
label define bpl_lbl 40500 `"Sweden"', add
label define bpl_lbl 41000 `"England"', add
label define bpl_lbl 41100 `"Scotland"', add
label define bpl_lbl 41200 `"Wales"', add
label define bpl_lbl 41300 `"United Kingdom, n.s."', add
label define bpl_lbl 41400 `"Ireland"', add
label define bpl_lbl 41410 `"Northern Ireland"', add
label define bpl_lbl 42000 `"Belgium"', add
label define bpl_lbl 42100 `"France"', add
label define bpl_lbl 42500 `"Netherlands"', add
label define bpl_lbl 42600 `"Switzerland"', add
label define bpl_lbl 43300 `"Greece"', add
label define bpl_lbl 43400 `"Italy"', add
label define bpl_lbl 43600 `"Portugal"', add
label define bpl_lbl 43610 `"Azores"', add
label define bpl_lbl 43800 `"Spain"', add
label define bpl_lbl 45000 `"Austria"', add
label define bpl_lbl 45200 `"Czechoslavakia"', add
label define bpl_lbl 45212 `"Slovakia"', add
label define bpl_lbl 45213 `"Czech Republic"', add
label define bpl_lbl 45300 `"Germany"', add
label define bpl_lbl 45400 `"Hungary"', add
label define bpl_lbl 45500 `"Poland"', add
label define bpl_lbl 45600 `"Romania"', add
label define bpl_lbl 45650 `"Bulgaria"', add
label define bpl_lbl 45675 `"Albania"', add
label define bpl_lbl 45700 `"Yugoslavia"', add
label define bpl_lbl 45720 `"Bosnia and Herzegovina"', add
label define bpl_lbl 45730 `"Croatia"', add
label define bpl_lbl 45740 `"Macedonia"', add
label define bpl_lbl 45750 `"Serbia"', add
label define bpl_lbl 45760 `"Kosovo"', add
label define bpl_lbl 45770 `"Montenego"', add
label define bpl_lbl 46100 `"Estonia"', add
label define bpl_lbl 46200 `"Latvia"', add
label define bpl_lbl 46300 `"Lithuania"', add
label define bpl_lbl 46500 `"Other USSR/Russia"', add
label define bpl_lbl 46530 `"Ukraine"', add
label define bpl_lbl 46535 `"Belarus"', add
label define bpl_lbl 46540 `"Moldova"', add
label define bpl_lbl 46590 `"USSR, n.s."', add
label define bpl_lbl 49900 `"Europe, n.s."', add
label define bpl_lbl 50000 `"China"', add
label define bpl_lbl 50010 `"Hong Kong"', add
label define bpl_lbl 50040 `"Taiwan"', add
label define bpl_lbl 50100 `"Japan"', add
label define bpl_lbl 50200 `"Korea"', add
label define bpl_lbl 50220 `"South Korea"', add
label define bpl_lbl 50300 `"Mongolia"', add
label define bpl_lbl 51100 `"Cambodia"', add
label define bpl_lbl 51200 `"Indonesia"', add
label define bpl_lbl 51300 `"Laos"', add
label define bpl_lbl 51400 `"Malaysia"', add
label define bpl_lbl 51500 `"Philippines"', add
label define bpl_lbl 51600 `"Singapore"', add
label define bpl_lbl 51700 `"Thailand"', add
label define bpl_lbl 51800 `"Vietnam"', add
label define bpl_lbl 52000 `"Afghanistan"', add
label define bpl_lbl 52100 `"India"', add
label define bpl_lbl 52110 `"Bangladesh"', add
label define bpl_lbl 52120 `"Bhutan"', add
label define bpl_lbl 52130 `"Burma"', add
label define bpl_lbl 52140 `"Pakistan"', add
label define bpl_lbl 52150 `"Sri Lanka"', add
label define bpl_lbl 52200 `"Nepal"', add
label define bpl_lbl 55100 `"Armenia"', add
label define bpl_lbl 55200 `"Azerbaijan"', add
label define bpl_lbl 55300 `"Georgia"', add
label define bpl_lbl 55400 `"Uzbekistan"', add
label define bpl_lbl 55500 `"Kazakhstan"', add
label define bpl_lbl 53000 `"Iran"', add
label define bpl_lbl 53200 `"Iraq"', add
label define bpl_lbl 53400 `"Israel"', add
label define bpl_lbl 53420 `"Palestine"', add
label define bpl_lbl 53500 `"Jordan"', add
label define bpl_lbl 53700 `"Lebanon"', add
label define bpl_lbl 54000 `"Saudi Arabia"', add
label define bpl_lbl 54100 `"Syria"', add
label define bpl_lbl 54200 `"Turkey"', add
label define bpl_lbl 54300 `"Cyprus"', add
label define bpl_lbl 54350 `"Kuwait"', add
label define bpl_lbl 54400 `"Yemen"', add
label define bpl_lbl 54500 `"United Arab Emirates"', add
label define bpl_lbl 54700 `"Middle East, n.s."', add
label define bpl_lbl 59900 `"Asia, n.e.c./n.s."', add
label define bpl_lbl 60010 `"Northern Africa"', add
label define bpl_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpl_lbl 60014 `"Morocco"', add
label define bpl_lbl 60016 `"Algeria"', add
label define bpl_lbl 60018 `"Sudan"', add
label define bpl_lbl 60019 `"Libya"', add
label define bpl_lbl 60023 `"Ghana"', add
label define bpl_lbl 60031 `"Nigeria"', add
label define bpl_lbl 60032 `"Cameroon"', add
label define bpl_lbl 60033 `"Cape Verde"', add
label define bpl_lbl 60034 `"Liberia"', add
label define bpl_lbl 60035 `"Senegal"', add
label define bpl_lbl 60036 `"Sierra Leone"', add
label define bpl_lbl 60037 `"Guinea"', add
label define bpl_lbl 60038 `"Ivory Coast"', add
label define bpl_lbl 60039 `"Togo"', add
label define bpl_lbl 60040 `"Eritrea"', add
label define bpl_lbl 60044 `"Ethiopia"', add
label define bpl_lbl 60045 `"Kenya"', add
label define bpl_lbl 60050 `"Somalia"', add
label define bpl_lbl 60060 `"Tanzania"', add
label define bpl_lbl 60065 `"Uganda"', add
label define bpl_lbl 60070 `"Zimbabwe"', add
label define bpl_lbl 60094 `"South Africa (Union of)"', add
label define bpl_lbl 60095 `"Zaire"', add
label define bpl_lbl 60096 `"Congo"', add
label define bpl_lbl 60097 `"Zambia"', add
label define bpl_lbl 60099 `"Africa, n.s./n.e.c."', add
label define bpl_lbl 70010 `"Australia"', add
label define bpl_lbl 70020 `"New Zealand"', add
label define bpl_lbl 71000 `"Pacific Islands"', add
label define bpl_lbl 71021 `"Fiji"', add
label define bpl_lbl 71022 `"Tonga"', add
label define bpl_lbl 71023 `"Samoa"', add
label define bpl_lbl 71024 `"Marshall Islands"', add
label define bpl_lbl 72000 `"Micronesia"', add
label define bpl_lbl 96000 `"Other, n.e.c. and unknown"', add
label define bpl_lbl 99999 `"NIU"', add
label values bpl bpl_lbl

label define citizen_lbl 1 `"Born in U.S"'
label define citizen_lbl 2 `"Born in U.S. outlying"', add
label define citizen_lbl 3 `"Born abroad of American parents"', add
label define citizen_lbl 4 `"Naturalized citizen"', add
label define citizen_lbl 5 `"Not a citizen"', add
label define citizen_lbl 9 `"NIU"', add
label values citizen citizen_lbl

label define empstat_lbl 00 `"NIU"'
label define empstat_lbl 01 `"Armed Forces"', add
label define empstat_lbl 10 `"At work"', add
label define empstat_lbl 12 `"Has job, not at work last week"', add
label define empstat_lbl 20 `"Unemployed"', add
label define empstat_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_lbl 22 `"Unemployed, new worker"', add
label define empstat_lbl 30 `"Not in labor force"', add
label define empstat_lbl 31 `"NILF, housework"', add
label define empstat_lbl 32 `"NILF, unable to work"', add
label define empstat_lbl 33 `"NILF, school"', add
label define empstat_lbl 34 `"NILF, other"', add
label define empstat_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label define empstat_lbl 36 `"NILF, retired"', add
label values empstat empstat_lbl

label define labforce_lbl 0 `"NIU"'
label define labforce_lbl 1 `"No, not in the labor force"', add
label define labforce_lbl 2 `"Yes, in the labor force"', add
label values labforce labforce_lbl

label define classwkr_lbl 00 `"NIU"'
label define classwkr_lbl 10 `"Self-employed"', add
label define classwkr_lbl 13 `"Self-employed, not incorporated"', add
label define classwkr_lbl 14 `"Self-employed, incorporated"', add
label define classwkr_lbl 20 `"Works for wages or salary"', add
label define classwkr_lbl 21 `"Wage/salary, private"', add
label define classwkr_lbl 22 `"Private, for profit"', add
label define classwkr_lbl 23 `"Private, nonprofit"', add
label define classwkr_lbl 24 `"Wage/salary, government"', add
label define classwkr_lbl 25 `"Federal government employee"', add
label define classwkr_lbl 26 `"Armed forces"', add
label define classwkr_lbl 27 `"State government employee"', add
label define classwkr_lbl 28 `"Local government employee"', add
label define classwkr_lbl 29 `"Unpaid family worker"', add
label define classwkr_lbl 99 `"Missing/Unknown"', add
label values classwkr classwkr_lbl

label define uhrsworkt_lbl 997 `"Hours vary"'
label define uhrsworkt_lbl 999 `"NIU"', add
label values uhrsworkt uhrsworkt_lbl

label define whyunemp_lbl 0 `"NIU"'
label define whyunemp_lbl 1 `"Job loser - on layoff"', add
label define whyunemp_lbl 2 `"Other job loser"', add
label define whyunemp_lbl 3 `"Temporary job ended"', add
label define whyunemp_lbl 4 `"Job leaver"', add
label define whyunemp_lbl 5 `"Re-entrant"', add
label define whyunemp_lbl 6 `"New entrant"', add
label values whyunemp whyunemp_lbl

label define whyabsnt_lbl 00 `"NIU"'
label define whyabsnt_lbl 01 `"On temporary layoff (under 30 days)"', add
label define whyabsnt_lbl 02 `"On indefinite layoff (30+ days)"', add
label define whyabsnt_lbl 03 `"Slack work/business conditions"', add
label define whyabsnt_lbl 04 `"Waiting for a new job to begin"', add
label define whyabsnt_lbl 05 `"Vacation/personal days"', add
label define whyabsnt_lbl 06 `"Own illness/injury/medical problems"', add
label define whyabsnt_lbl 07 `"Child care problems"', add
label define whyabsnt_lbl 08 `"Other family/personal obligation"', add
label define whyabsnt_lbl 09 `"Maternity/paternity leave"', add
label define whyabsnt_lbl 10 `"Labor dispute"', add
label define whyabsnt_lbl 11 `"Weather affected job"', add
label define whyabsnt_lbl 12 `"School/training"', add
label define whyabsnt_lbl 13 `"Civic/military duty"', add
label define whyabsnt_lbl 14 `"Does not work in the business"', add
label define whyabsnt_lbl 15 `"Other"', add
label values whyabsnt whyabsnt_lbl

label define whyptlwk_lbl 000 `"NIU"'
label define whyptlwk_lbl 001 `"No response"', add
label define whyptlwk_lbl 010 `"Slack work, business conditions"', add
label define whyptlwk_lbl 011 `"Material shortage"', add
label define whyptlwk_lbl 012 `"Plant or machine repairs"', add
label define whyptlwk_lbl 020 `"Seasonal work"', add
label define whyptlwk_lbl 030 `"Weather affected job"', add
label define whyptlwk_lbl 040 `"Labor dispute"', add
label define whyptlwk_lbl 050 `"job started/ended during week"', add
label define whyptlwk_lbl 051 `"New job started"', add
label define whyptlwk_lbl 052 `"Job terminated"', add
label define whyptlwk_lbl 060 `"Could only find part-time"', add
label define whyptlwk_lbl 070 `"Not want full time work"', add
label define whyptlwk_lbl 071 `"Retired/SS limit on earnings"', add
label define whyptlwk_lbl 080 `"Full time work week under 35 hours"', add
label define whyptlwk_lbl 081 `"Full time peak season only"', add
label define whyptlwk_lbl 090 `"Holiday"', add
label define whyptlwk_lbl 100 `"Own illness"', add
label define whyptlwk_lbl 101 `"Health/medical limitation"', add
label define whyptlwk_lbl 110 `"On vacation"', add
label define whyptlwk_lbl 111 `"Vacation/personal day"', add
label define whyptlwk_lbl 120 `"Too busy with house, school, etc"', add
label define whyptlwk_lbl 121 `"Child care problems"', add
label define whyptlwk_lbl 122 `"Other family/personal obligations"', add
label define whyptlwk_lbl 123 `"School/training"', add
label define whyptlwk_lbl 124 `"Civic/military duty"', add
label define whyptlwk_lbl 130 `"Other"', add
label values whyptlwk whyptlwk_lbl

label define wkstat_lbl 10 `"Full-time schedules"'
label define wkstat_lbl 11 `"Full-time hours (35+), usually full-time"', add
label define wkstat_lbl 12 `"Part-time for non-economic reasons, usually full-time"', add
label define wkstat_lbl 13 `"Not at work, usually full-time"', add
label define wkstat_lbl 14 `"Full-time hours, usually part-time for economic reasons"', add
label define wkstat_lbl 15 `"Full-time hours, usually part-time for non-economic reasons"', add
label define wkstat_lbl 20 `"Part-time for economic reasons"', add
label define wkstat_lbl 21 `"Part-time for economic reasons, usually full-time"', add
label define wkstat_lbl 22 `"Part-time hours, usually part-time for economic reasons"', add
label define wkstat_lbl 40 `"Part-time for non-economic reasons, usually part-time"', add
label define wkstat_lbl 41 `"Part-time hours, usually part-time for non-economic reasons"', add
label define wkstat_lbl 42 `"Not at work, usually part-time"', add
label define wkstat_lbl 50 `"Unemployed, seeking full-time work"', add
label define wkstat_lbl 60 `"Unemployed, seeking part-time work"', add
label define wkstat_lbl 99 `"NIU, blank, or not in labor force"', add
label values wkstat wkstat_lbl

label define educ_lbl 000 `"NIU or no schooling"'
label define educ_lbl 001 `"NIU or blank"', add
label define educ_lbl 002 `"None or preschool"', add
label define educ_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_lbl 011 `"Grade 1"', add
label define educ_lbl 012 `"Grade 2"', add
label define educ_lbl 013 `"Grade 3"', add
label define educ_lbl 014 `"Grade 4"', add
label define educ_lbl 020 `"Grades 5 or 6"', add
label define educ_lbl 021 `"Grade 5"', add
label define educ_lbl 022 `"Grade 6"', add
label define educ_lbl 030 `"Grades 7 or 8"', add
label define educ_lbl 031 `"Grade 7"', add
label define educ_lbl 032 `"Grade 8"', add
label define educ_lbl 040 `"Grade 9"', add
label define educ_lbl 050 `"Grade 10"', add
label define educ_lbl 060 `"Grade 11"', add
label define educ_lbl 070 `"Grade 12"', add
label define educ_lbl 071 `"12th grade, no diploma"', add
label define educ_lbl 072 `"12th grade, diploma unclear"', add
label define educ_lbl 073 `"High school diploma or equivalent"', add
label define educ_lbl 080 `"1 year of college"', add
label define educ_lbl 081 `"Some college but no degree"', add
label define educ_lbl 090 `"2 years of college"', add
label define educ_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_lbl 092 `"Associate's degree, academic program"', add
label define educ_lbl 100 `"3 years of college"', add
label define educ_lbl 110 `"4 years of college"', add
label define educ_lbl 111 `"Bachelor's degree"', add
label define educ_lbl 120 `"5+ years of college"', add
label define educ_lbl 121 `"5 years of college"', add
label define educ_lbl 122 `"6+ years of college"', add
label define educ_lbl 123 `"Master's degree"', add
label define educ_lbl 124 `"Professional school degree"', add
label define educ_lbl 125 `"Doctorate degree"', add
label define educ_lbl 999 `"Missing/Unknown"', add
label values educ educ_lbl

label define pension_lbl 0 `"NIU"'
label define pension_lbl 1 `"No pension plan at work"', add
label define pension_lbl 2 `"Pension plan at work, but not included"', add
label define pension_lbl 3 `"Included in pension plan at work"', add
label values pension pension_lbl

label define firmsize_lbl 0 `"NIU"'
label define firmsize_lbl 1 `"Under 10"', add
label define firmsize_lbl 2 `"10 to 24"', add
label define firmsize_lbl 3 `"Under 25"', add
label define firmsize_lbl 4 `"10 to 49"', add
label define firmsize_lbl 5 `"25 to 99"', add
label define firmsize_lbl 6 `"50 to 99"', add
label define firmsize_lbl 7 `"100 to 499"', add
label define firmsize_lbl 8 `"500 to 999"', add
label define firmsize_lbl 9 `"1000+"', add
label values firmsize firmsize_lbl

label define srcdisa2_lbl 00 `"NIU"'
label define srcdisa2_lbl 01 `"Workers compensation"', add
label define srcdisa2_lbl 02 `"Company or union disability"', add
label define srcdisa2_lbl 03 `"Federal govt disability"', add
label define srcdisa2_lbl 04 `"US military retirement disability"', add
label define srcdisa2_lbl 05 `"State or local govt employee disability"', add
label define srcdisa2_lbl 06 `"US railroad retirement disability"', add
label define srcdisa2_lbl 07 `"Accident or disability insurance"', add
label define srcdisa2_lbl 08 `"Black lung miners disability"', add
label define srcdisa2_lbl 09 `"State temporary sickness"', add
label define srcdisa2_lbl 10 `"Other or don't know"', add
label values srcdisa2 srcdisa2_lbl

label define srcreti1_lbl 0 `"NIU"'
label define srcreti1_lbl 1 `"Company or Union  pension"', add
label define srcreti1_lbl 2 `"Federal Government retirement Pension"', add
label define srcreti1_lbl 3 `"US Military retirement pension"', add
label define srcreti1_lbl 4 `"State or local Govt retirement pension"', add
label define srcreti1_lbl 5 `"US Railroad retirement pension"', add
label define srcreti1_lbl 6 `"Regular payments from annuities or paid-up insurance policies"', add
label define srcreti1_lbl 7 `"Regular payments from IRA, KEOGH, or 401K accounts"', add
label define srcreti1_lbl 8 `"Other or don't know"', add
label values srcreti1 srcreti1_lbl

label define srcreti2_lbl 0 `"NIU"'
label define srcreti2_lbl 1 `"Company or Union  pension"', add
label define srcreti2_lbl 2 `"Federal Government retirement Pension"', add
label define srcreti2_lbl 3 `"US Military retirement pension"', add
label define srcreti2_lbl 4 `"State or local Govt retirement pension"', add
label define srcreti2_lbl 5 `"US Railroad retirement pension"', add
label define srcreti2_lbl 6 `"Regular payments from annuities or paid-up insurance policies"', add
label define srcreti2_lbl 7 `"Regular payments from IRA, KEOGH, or 401K accounts"', add
label define srcreti2_lbl 8 `"Other or do not know"', add
label values srcreti2 srcreti2_lbl

label define whyss1_lbl 0 `"NIU"'
label define whyss1_lbl 1 `"Retired"', add
label define whyss1_lbl 2 `"Disabled (adult or child)"', add
label define whyss1_lbl 3 `"Widowed"', add
label define whyss1_lbl 4 `"Spouse"', add
label define whyss1_lbl 5 `"Surviving child"', add
label define whyss1_lbl 6 `"Dependent child"', add
label define whyss1_lbl 7 `"On behalf of surviving, dependent, or disabled child(ren)"', add
label define whyss1_lbl 8 `"Other (adult or child)"', add
label values whyss1 whyss1_lbl

label define whyss2_lbl 0 `"NIU"'
label define whyss2_lbl 1 `"Retired"', add
label define whyss2_lbl 2 `"Disabled (adult or child)"', add
label define whyss2_lbl 3 `"Widowed"', add
label define whyss2_lbl 4 `"Spouse"', add
label define whyss2_lbl 5 `"Surviving child"', add
label define whyss2_lbl 6 `"Dependent child"', add
label define whyss2_lbl 7 `"On behalf of surviving, dependent, or disabled child(ren)"', add
label define whyss2_lbl 8 `"Other (adult or child)"', add
label values whyss2 whyss2_lbl

label define offpov_lbl 01 `"Below Poverty Line"'
label define offpov_lbl 02 `"Above Poverty Line"', add
label define offpov_lbl 99 `"NIU"', add
label values offpov offpov_lbl

label define offpovuniv_lbl 00 `"Out of Poverty Universe"'
label define offpovuniv_lbl 01 `"In Poverty Universe"', add
label values offpovuniv offpovuniv_lbl

label define disabwrk_lbl 0 `"NIU"'
label define disabwrk_lbl 1 `"No disability that affects work"', add
label define disabwrk_lbl 2 `"Disability limits or prevents work"', add
label values disabwrk disabwrk_lbl

label define health_lbl 1 `"Excellent"'
label define health_lbl 2 `"Very good"', add
label define health_lbl 3 `"Good"', add
label define health_lbl 4 `"Fair"', add
label define health_lbl 5 `"Poor"', add
label values health health_lbl

label define quitsick_lbl 0 `"NIU"'
label define quitsick_lbl 1 `"No, did not quit job or retire"', add
label define quitsick_lbl 2 `"Yes, quit job or retired"', add
label values quitsick quitsick_lbl

label define inclugh_lbl 0 `"NIU"'
label define inclugh_lbl 1 `"No"', add
label define inclugh_lbl 2 `"Yes"', add
label values inclugh inclugh_lbl

label define paidgh_lbl 00 `"NIU"'
label define paidgh_lbl 10 `"No"', add
label define paidgh_lbl 20 `"Yes"', add
label define paidgh_lbl 21 `"Yes, paid for part"', add
label define paidgh_lbl 22 `"Yes, paid for all"', add
label values paidgh paidgh_lbl

label define himcaid_lbl 1 `"No"'
label define himcaid_lbl 2 `"Yes"', add
label values himcaid himcaid_lbl

label define gotwic_lbl 0 `"NIU"'
label define gotwic_lbl 1 `"No"', add
label define gotwic_lbl 2 `"Yes"', add
label values gotwic gotwic_lbl

label define union_lbl 0 `"NIU"'
label define union_lbl 1 `"No union coverage"', add
label define union_lbl 2 `"Member of labor union"', add
label define union_lbl 3 `"Covered by union but not a member"', add
label values union union_lbl
}

//Summary statistics
replace incwage = . if incwage == 9999999
replace incwage = . if incwage == 9999998

su incwage
su incwage if union != 0
su incwage if union == 0

tab statefip if year == 2007

*Create employed dummy
gen empstat_revised = empstat == 10
replace empstat_revised = 0 if empstat != 10 & empstat !=0
replace empstat_revised = . if empstat == 0 

//Summary graphs
*General graph showing union wages higher in levels and rates than nonunion wages

gen union_revised = 1 if union >= 2
replace union_revised = 0 if union < 2

egen incwagemean_union = mean(incwage) if union_revised==1 & empstat_revised==1, by(year) 
egen incwagemean = mean(incwage) if union_revised==0 & empstat_revised==1, by(year) 

*Graph 01_Earned Income by Type of Worker
twoway line incwagemean_union year, color("22 150 210") ytitle("Earned Income") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid) xtitle("Year") ///
	ti("Earned Income by Type of Worker") legend(order(1 "Unionized Earned Income" ///
	2 "Nonunionized Earned Income") position(6)) ///
	|| line incwagemean year

*Look at earned income distribution between union vs. nonunion workers, winsorized (maybe conditionalize on employment)

*Graph 02_Earned Income Density by Worker Type
twoway (hist incwage if union_revised==1 & incwage < 500000, color("22 150 210") width(10000) ///
		xtitle("Earned Income") ytitle("Frequency") ti("Unionized Earned Income Density") ///
		ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)) ///
		(hist incwage if union_revised==0 & incwage < 500000, lcolor(black) fcolor(none) width(10000) ///
		xtitle("Earned Income") ytitle("Frequency") ///
		ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)), ///
		legend(order(0 "Nonunionized Earned Income Density" 1 "Unionized Earned Income Density" ) ///
		ti("Earned Income Density by Worker Type") position(6))

*Look at general union count decline over time, create union density variable
sort statefip year
by statefip year: egen count_union=count(union_revised) if union_revised==1
by statefip year: egen total_pop=count(_N)

gen union_density = .
replace union_density = count_union/total_pop

sort year
by year: egen mean_union_density = mean(union_density)


*Graph 03_Unionized Worker Count by Year
twoway scatter unioncount year if year >= 2005, mcolor("22 150 210") ///
	ytitle("Unionized Worker Count") xtitle("Year") ti("Unionized Worker Count by Year") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)

sort year
twoway scatter mean_union_density year if year >= 2005, mcolor("22 150 210") ///
	ytitle("Unionized Worker Density") xtitle("Year") ti("Unionized Worker Density by Year") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)

**Now look at union membership in RTW vs non-RTW states and compare to nonunion states
*Define dummy for RTW states
# delimit ;
gen RTW =
	statefip == 01 |
	statefip == 04 |
	statefip == 05 |
	statefip == 12 | 
	statefip == 13 | 
	statefip == 16 |
	statefip == 18 | 
	statefip == 19 | 
	statefip == 20 |
	statefip == 22 | 
	statefip == 26 | 
	statefip == 28 | 
	statefip == 31 |
	statefip == 37 | 
	statefip == 38 | 
	statefip == 40 | 
	statefip == 45 |
	statefip == 46 | 
	statefip == 47 | 
	statefip == 48 |
	statefip == 49 | 
	statefip == 51 |
	statefip == 54 |
	statefip == 55 | 
	statefip == 56 
;
# delimit cr

*Compare mean wages for RTW, Non-RTW, and general mean earned income over time
egen incwagemean_rtw = mean(incwage) if (union_revised==1 & RTW==1) | (union_revised==0 & RTW==1), by(year) 
egen incwagemean_nonrtw = mean(incwage) if (union_revised==1 & RTW==0) | (union_revised==0 & RTW==0), by(year) 

*Graph 04_Earned Income by Type of State
twoway line incwagemean_nonrtw year if RTW==0, color("22 150 210") ytitle("Average Earned Income") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid) xtitle("Year") ///
	ti("Earned Income by Type of State") legend(order(0 "Non-Right to Work States" ///
	1 "Right to Work States") position(6)) || line incwagemean_rtw year if RTW==1
	
*Set up single state Event Study, Indiana
gen time = .
replace time = year-2012

*Becaues negative factor vars cause problems when running regressions; t=0 is now t=6
replace time = time + 6
replace time = . if time < 0

*Generate event window
gen event_window = 1
replace event_window = 0 if time <= 0
replace event_window = 0 if time > 10

//Create T and C Groups for Midwest
gen treat = 1 if statefip == 18
replace treat = 0 if statefip == 27 | statefip == 17 | statefip == 29

gen lnincwage = ln(incwage)

//Check union density within states that implement Right to Work. Looks like there are preexisting downward trends in all three treatment states.
*Union density by year for Indiana
twoway scatter union_density year if statefip==18 & year >= 2005, mcolor("22 150 210") ///
	ytitle("Unionized Worker Density") xtitle("Year") ti("Unionized Worker Density by Year") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)
	
*Union density by year for Michigan
twoway scatter union_density year if statefip==26 & year >= 2005, mcolor("22 150 210") ///
	ytitle("Unionized Worker Density") xtitle("Year") ti("Unionized Worker Density by Year") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)
	
*Union density by year for Wisconsin
twoway scatter union_density year if statefip==55 & year >= 2005, mcolor("22 150 210") ///
	ytitle("Unionized Worker Density") xtitle("Year") ti("Unionized Worker Density by Year") ///
	ylabel(, labsize(vsmall) nogrid) xlab(,nogrid)

//Regression
*(1) Naive regression for union vs. nonunion wages, illustrating level difference of Figure 1.
reg lnincwage union_revised

*(2) Now with year, state, age FE, clustered by state to account for correlation across dataset, effectively the same as Specification 1
reg lnincwage union_revised i.year i.statefip

*Re: Union Density Regresion
reg union_density i.treat##b5.time i.sex i.race empstat [pweight=earnwt]
margins treat, at(time=(1(1)12))
marginsplot

*Re: ln(wages) Now conduct DiD for union members in ALL T states vs. C states defined earlier
reg lnincwage i.treat##b5.time i.sex i.race empstat i.age [pweight=earnwt]
margins treat, at(time=(1(1)12))
marginsplot

**Look up how to restart stata from certain point, potentially in IPA training
**Look up predict graphs
**Conduct similar graphs, at the very lest predictive margins, for other T states one-by-one

	
//Conditional on RTW state, create var. where 0=pre, 1=post
*gen RTWtime=0 if (statefip==18 & year <=2012) | (statefip==26 & year <=2013) | (statefip==55 & year <=2015)
*replace RTWtime=1 if (statefip==18 & year > 2012) | (statefip==26 & year > 2013) | (statefip==55 & year > 2015)

/*
//Normalize event at t=0 for each RTW state
sort statefip year

gen time = .
replace time = year-2012

**Indiana at year 2012
gen t_indi = .
replace t_indi = year-2012

**Michigan at year 2013
gen t_mich = .
replace t_mich = year-2013

**Wisconsin at year 2015
gen t_wisc = .
replace t_wisc = year-2015

**West Virginia at year 2016
gen t_wvir = .
replace t_wvir = year-2016


*Now create Event Window dummy; [-6 to 4]
foreach x in indi mich wisc {
gen t_`x'2 = .
replace t_`x'2 = t_`x' if t_`x' >= -6 & t_`x' <= 4
}


*Create normalized, time-bound variable for all Treatment States
gen t_norm = .
replace t_norm = t_indi2 if statefip == 18
replace t_norm = t_mich2 if statefip == 26
replace t_norm = t_wisc2 if statefip == 55

*sort statefip year t_norm
*browse statefip year t_norm 


**Becaues negative factor vars cause problems when running regressions; t=0 is now t=6
foreach x in indi mich wisc {
gen t_`x'3 = .
replace t_`x'3 = t_`x'2 + 7
}

*Not sure if this is useful
*gen eventwindow = 1 if event_t == 1 | event_t == 0
*replace eventwindow = 0 if eventwindow != 1


*Create T vs C, at first only for Michigan, compared to 
gen treatm = 1 if statefip == 26
replace treatm = 0 if statefip == 27 | statefip == 17 | statefip == 29

*Create T vs C for all groups
gen treat = 1 if statefip == 18 | statefip == 26 | statefip == 55
replace treat = 0 if statefip == 27 | statefip == 17 | statefip == 29

//Naive regressions
*Generage ln(wage)
gen lnincwage = ln(incwage)

reg lnincwage union_revised

*Now with year, state, age FE, clustered by state to account for correlation across dataset
reg lnincwage union_revised i.year i.statefip i.age

*Re: ln(wages) Now conduct DiD for union members in ALL T states vs. C states defined earlier
reg lnincwage i.treat##i.union_revised i.age i.sex i.race i.year empstat [pweight=earnwt]

*Re: Union Count: Now conduct DiD for union members in ALL T states vs. C states defined earlier
reg unioncount i.treat##i.union_revised i.age i.sex i.race i.year empstat [pweight=earnwt]

**How sensitive is this to bandwidth changes?

**Re: ln(wages) Now conduct event study DiD for union members in all T states vs. C states (need to add education)
reg lnincwage b2012.year##i.treat##i.union_revised i.age i.sex i.race empstat [pweight=earnwt]

**Re: Union Count: Now conduct event study DiD for union members in all T states vs. C states (need to add education)
reg lnincwage b2012.year##i.treat##i.union_revised i.age i.sex i.race empstat [pweight=earnwt]


//Review
* placebo

*first differences



**Now create universal event_t=0/1 if state is pre/post t=0 within event window
/*gen event_t = .

replace event_t = 1 if t_indi >= 1 & t_indi <= 4 & statefip == 18
replace event_t = 0 if t_indi < 1 & t_indi >= -11 & statefip == 18 

replace event_t = 1 if t_mich >= 1 & t_mich <= 4 & statefip == 26
replace event_t = 0 if t_mich < 1 & t_mich >= -11 & statefip == 26

replace event_t = 1 if t_wisc >= 1 & t_wisc <= 4 & statefip == 55
replace event_t = 0 if t_wisc < 1 & t_wisc >= -11 & statefip == 55


*/





