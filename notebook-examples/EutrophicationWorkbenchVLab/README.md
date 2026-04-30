# Eutrophication Workbench (EWB)

## Quick Start (for VRE users)

The **Eutrophication Workbench (EWB)** is a Blue‑Cloud Virtual Lab supporting the creation of **harmonised, quality‑controlled Essential Ocean Variable (EOV) data collections** for eutrophication assessment.

This guide describes the **standard EWB workflow** using **BEACON**, **CW Duplicate Tool**, **FileForge**, and **webODV**.

---

## Workflow Overview

Each step runs in a **dedicated execution environment**.

---

## Step 0 – Setup Folder Architecture (JupyterLab)

**Environment:** JupyterLab  
**Purpose:** Create the complete folder structure and configuration files for the workflow.

1. Open **JupyterLab** in the EWB VLab.
2. Navigate to your home workspace: `/home/jovyan/workspace`
3. Create a **copy** of: `00_Start_Here_RUNME.ipynb`
4. Open and run the notebook in your copied workspace.
5. When prompted, enter:
   - Your initials (user identifier)
   - Start year and month (YYYYMM format)
   - End year and month (YYYYMM format)
   - Depth range from (metres)
   - Depth range to (metres)

### Output

The notebook automatically creates:
- `1_DatalakeQuery/`: For BEACON queries
- `2_CWduplicates-tool/`: Configuration for duplicate removal
- `3_FileForge/`: FileForge configurations and outputs
- `cw_user_config.yaml`: Pre-configured CW Duplicate Tool settings

> **Note:** This step must be executed **before** running the subsequent workflow steps.

---

## Step 1 – Access & Harmonise Data with BEACON (JupyterLab)

**Environment:** JupyterLab  
**Purpose:** Access, subset, merge, and harmonise EOV data from multiple Blue Data Infrastructures.

1. Open **JupyterLab** in the EWB VLab.
2. Navigate to: `1_DatalakeQuery/Merged_notebooks/`
3. Open and run: `01_EWB_BEACON=merged-v1.5.4_FILTER=BDI-FeatureType_VAR=allEOV_OUT=parquet.ipynb`
4. Set your **Blue‑Cloud token** when prompted  
(Top panel → *How‑to* → *Authorization‑How‑to*).

### Output

Harmonised EOV datasets are written in **Parquet format** to:
`1_DatalakeQuery/outputs/`

These files are **ready to be used as input for duplicate detection**.

---

## Step 2 – Detect Duplicates with CW (CCP)

**Environment:** Cloud Computing Platform (CCP)  
**Purpose:** Detect and classify duplicates across BDIs.

1. Open the **CCP** tab.
2. Launch the **CW Duplicate Tool**.
3. Select the CW configuration generated in **Step 0**: `cw_user_config.yaml`
4. Run the tool.

### Output

CW results are written to:
`2_CWduplicates-tool/outputs/`

## Step 3 – Remove Duplicates & Convert to ODV with FileForge (CCP)

**Environment:** Cloud Computing Platform (CCP)  
**Purpose:** Apply CW decisions and convert datasets to ODV format.

1. In the **CCP**, launch **FileForge**.
2. Select:
   - CW outputs from Step 2
   - A suitable FileForge YAML configuration from `3_FileForge/Configuration_files/`
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

## Eutrophication workbench Vlab Folder Structure and Roles

/Eutrophication-Workbench/
├── 0_Documentation/ # User guides and technical documentation
├── 1_BEACON/ # BEACON notebooks and outputs (JupyterLab)
├── 2_CWduplicates-tool/ # Duplicate detection (CCP)
├── 3_FileForge/ # Duplicate removal & ODV conversion (CCP)
├── 4_webODV/ # webODV collections
├── 0_Start_Here_RUNME.ipynb # Initial setup notebook
└── README.md


| Folder | Role | Environment |
|------|-----|-------------|
| `1_DatalakeQuery` | Data access & harmonisation | JupyterLab |
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
- **Always run Step 0 first** to create the necessary folder structure and configuration files before proceeding with subsequent steps.

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
- The Eutrophication Workbench Vlab