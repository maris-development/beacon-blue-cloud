# Eutrophication Workbench (EWB)

## Quick Start (for VRE users)

The **Eutrophication Workbench (EWB)** is a Blue‑Cloud Virtual Lab supporting the creation of **harmonised, quality‑controlled Essential Ocean Variable (EOV) data collections** for eutrophication assessment.

This guide describes the **standard EWB workflow** using **BEACON**, **CW Duplicate Tool**, **FileForge**, and **webODV**.

---

## Workflow Overview

Each step runs in a **dedicated execution environment**.

---

## Step 1 – Access & Harmonise Data with BEACON (JupyterLab)

**Environment:** JupyterLab  
**Purpose:** Access, subset, merge, and harmonise EOV data from multiple Blue Data Infrastructures.

1. Open **JupyterLab** in the EWB VLab.
2. Navigate to: Eutrophication-Workbench/1_BEACON/Merged_notebooks/
3. Open and run: 01_EWB_BEACON=merged-v1.5.4_FILTER=BDI-FeatureType_VAR=allEOV_OUT=parquet.ipynb
4. Set your **Blue‑Cloud token** when prompted  
(Top panel → *How‑to* → *Authorization‑How‑to*).

### Output

Harmonised EOV datasets are written in **Parquet format** to:
Eutrophication-Workbench/1_BEACON/outputs/

These files are **ready to be used as input for duplicate detection**.

---

## Step 2 – Detect Duplicates with CW (CCP)

**Environment:** Cloud Computing Platform (CCP)  
**Purpose:** Detect and classify duplicates across BDIs.

1. Open the **CCP** tab.
2. Launch the **CW Duplicate Tool**.
3. The required input folder structure has been implemented on step 0.
4. Select an appropriate CW configuration.
5. Run the tool.

### Output

CW results are written to:
Eutrophication-Workbench/2_CWduplicates-tool/Results/<date>_cw_duplicates_tools_output/

## Step 3 – Remove Duplicates & Convert to ODV with FileForge (CCP)

**Environment:** Cloud Computing Platform (CCP)  
**Purpose:** Apply CW decisions and convert datasets to ODV format.

1. In the **CCP**, launch **FileForge**.
2. Select:
   - CW outputs from Step 2
   - A suitable FileForge YAML configuration.
3. Run FileForge.

### Output

ODV‑compatible files are written to a CCP execution directory, for example:
/Workspace/CCP/executions/FileForge_v._0.1.9/.../outputs/output/
└── wb2_merged.txt

---

## Step 4 – Explore & Validate Data with webODV

**Environment:** webODV (web application)

1. Open **webODV** from the EWB interface.
2. Load the ODV file produced by FileForge.
3. Use webODV to:
   - Visualise
   - Perform interactive quality control
   - Extract subsets for analysis

---

## Folder Structure and Roles
Eutrophication-Workbench/
├── 0_Documentation/        # User guides and technical documentation
├── 1_BEACON/               # BEACON notebooks and outputs (JupyterLab)
├── 2_CWduplicates-tool/    # Duplicate detection (CCP)
├── 3_FileForge/            # Duplicate removal & ODV conversion (CCP)
├── 4_webODV/               # webODV collections
└── README.md

| Folder | Role | Environment |
|------|-----|-------------|
| `1_BEACON` | Data access & harmonisation | JupyterLab |
| `2_CWduplicates-tool` | Duplicate detection | CCP |
| `3_FileForge` | Cleaning & format conversion | CCP |
| `4_webODV` | Exploration & QC | webODV |

---

## Important Notes

- ⚠️ The EWB workflow is **hybrid**:
  - Not all steps are automated
  - Some steps require **user decisions**
- Execution environments are **intentionally separated** to ensure:
  - Transparency
  - Reproducibility
  - Scientific control

  ---

## FAIR & Policy Alignment

The Eutrophication Workbench follows **FAIR data principles** and supports:
- EU Marine Strategy Framework Directive (MSFD)
- UN Sustainable Development Goal 14
- EU Mission Ocean & Water

---

## Documentation & Support
For detailed instructions and background:
- See the contents of `0_Documentation/`
- Consult the tool‑specific guides for BEACON, CW, FileForge, and webODV

---

## Citation & Acknowledgement

If you use EWB datasets in publications or reports, please acknowledge:
- **Blue‑Cloud**
- The contributing Blue Data Infrastructures (Copernicus Marine, EMODnet Chemistry, World Ocean Database)