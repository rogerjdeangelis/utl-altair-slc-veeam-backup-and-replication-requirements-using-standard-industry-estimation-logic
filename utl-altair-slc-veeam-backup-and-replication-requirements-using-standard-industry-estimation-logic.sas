 %let pgm=utl-altair-slc-veeam-backup-and-replication-requirements-using-standard-industry-estimation-logic;

%stop_submission;

Veeam Backup and Replication requirements using standard industry estimation logic

Estimate how much storage is needed  for backup and replication for a year

PROBLEM (what we want)

  Projected Year 1 Storage Gb: 55000.0

Too long to post on a list, see github
[GITHUB] (https://github.com/rogerjdeangelis/utl-altair-slc-veeam-backup-and-replication-requirements-using-standard-industry-estimation-logic)
https://github.com/rogerjdeangelis/utl-altair-slc-veeam-backup-and-replication-requirements-using-standard-industry-estimation-logic

[SIEMENS FORUM](https://support.industry.siemens.com/cs/document/109808196)
https://support.industry.siemens.com/cs/document/109808196/vulnerabilities-in-veeam-affect-industrial-automation-datacenter-products?dti=0&lc=en-US

Perhaps an over simplified example, but it does follow the definition of Veeam.

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

options set=PYTHONHOME "D:\py314";
proc python;
submit;
def calculate_veeam_storage(
    num_vms,
    avg_vm_size_gb,
    daily_change_rate_percent,
    retention_days,
    annual_growth_rate_percent
):
    # Calculate daily data change (incremental)
    total_data_gb = num_vms * avg_vm_size_gb
    daily_change_gb = total_data_gb * (daily_change_rate_percent / 100)

    # Estimate total capacity: Initial Full + Incremental Retention
    # Note: Synthetic Fulls with block cloning drastically reduce this,
    # but for a conservative estimate, we factor the raw retention volume.
    base_storage_gb = total_data_gb + (daily_change_gb * retention_days)

    # Project year-one storage including annual growth
    year_1_storage_gb = base_storage_gb * (1 + annual_growth_rate_percent / 100)

    return {
        "total_source_data_gb": total_data_gb,
        "daily_change_gb": daily_change_gb,
        "estimated_retention_storage_gb": base_storage_gb,
        "projected_year_1_storage_gb": round(year_1_storage_gb, 2)
    }

# Core Sizing Factors (Hardcoded)
# Representing a standard 100-VM environment
vse_factors = {
    "num_vms": 100,
    "avg_vm_size_gb": 200,
    "daily_change_rate_percent": 5,
    "retention_days": 30,
    "annual_growth_rate_percent": 10
}

# Execution
results = calculate_veeam_storage(**vse_factors)
for key, value in results.items():
    print(f"{key.replace('_', ' ').title()}: {value}")
endsubmit;
run;quit;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*  Altair SLC                                                                                                            */
/*                                                                                                                        */
/* Total Source Data Gb: 20000                                                                                            */
/*                                                                                                                        */
/* Daily Change Gb: 1000.0                                                                                                */
/*                                                                                                                        */
/* Estimated Retention Storage Gb: 50000.0                                                                                */
/*                                                                                                                        */
/* Projected Year 1 Storage Gb: 55000.0                                                                                   */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC          15:49 Monday, April 27, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed

1         options set=PYTHONHOME "D:\py314";
2         proc python;
3         submit;
4         def calculate_veeam_storage(
5             num_vms,
6             avg_vm_size_gb,
7             daily_change_rate_percent,
8             retention_days,
9             annual_growth_rate_percent
10        ):
11            # Calculate daily data change (incremental)
12            total_data_gb = num_vms * avg_vm_size_gb
13            daily_change_gb = total_data_gb * (daily_change_rate_percent / 100)
14
15            # Estimate total capacity: Initial Full + Incremental Retention
16            # Note: Synthetic Fulls with block cloning drastically reduce this,
17            # but for a conservative estimate, we factor the raw retention volume.
18            base_storage_gb = total_data_gb + (daily_change_gb * retention_days)
19
20            # Project year-one storage including annual growth
21            year_1_storage_gb = base_storage_gb * (1 + annual_growth_rate_percent / 100)
22
23            return {
24                "total_source_data_gb": total_data_gb,
25                "daily_change_gb": daily_change_gb,
26                "estimated_retention_storage_gb": base_storage_gb,
27                "projected_year_1_storage_gb": round(year_1_storage_gb, 2)
28            }
29
30        # Core Sizing Factors (Hardcoded)
31        # Representing a standard 100-VM environment
32        vse_factors = {
33            "num_vms": 100,
34            "avg_vm_size_gb": 200,
35            "daily_change_rate_percent": 5,
36            "retention_days": 30,
37            "annual_growth_rate_percent": 10
38        }
39
40        # Execution
41        results = calculate_veeam_storage(**vse_factors)
42        for key, value in results.items():
43            print(f"{key.replace('_', ' ').title()}: {value}")
44        endsubmit;

NOTE: Submitting statements to Python:


45        run;quit;
NOTE: Procedure python step took :
      real time : 6.211
      cpu time  : 0.046


46
47
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 6.326
      cpu time  : 0.109
 /*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

