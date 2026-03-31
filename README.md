# EV Market Intelligence Dashboard — Python | PostgreSQL | Power BI

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![Domain](https://img.shields.io/badge/Domain-Automotive%20%7C%20EV%20Market-00C853?style=for-the-badge)

---

## 🏢 1. Background & Business Context

The global electric vehicle market is undergoing its fastest transformation in history. Governments are setting aggressive EV mandates, automakers are reallocating R&D budgets, and infrastructure companies are racing to build charging networks. Yet a fundamental question remains unanswered for most stakeholders: **who is actually buying EVs, where, and what does the adoption curve really look like?**

A data analyst is tasked with building an end-to-end EV market intelligence solution using real-world vehicle registration data to answer:

- Which manufacturers dominate the EV market — and by how much?
- Is the market shifting toward full BEV or staying with PHEV as a bridge?
- How has year-over-year EV adoption grown — and when did the inflection point occur?
- Which states lead adoption and which represent untapped expansion opportunities?
- What does range segmentation reveal about technology maturity across brands?

The resulting pipeline and dashboard gives automotive analysts, policy makers, and investors a **data-driven view of the EV landscape** — from raw registration records to boardroom-ready intelligence.

---

## 🗂️ 2. Data Structure

**Source:** Electric Vehicle Population Data (Washington State DMV — public dataset)
**Volume:** 279,780 registered electric vehicles

### Raw Table — `ev_data`

| Column | Type | Description |
|---|---|---|
| `Make` | TEXT | Vehicle manufacturer (Tesla, Chevrolet, Nissan etc.) |
| `Model` | TEXT | Vehicle model name |
| `Model Year` | INT | Year of manufacture |
| `State` | TEXT | State of registration |
| `County` | TEXT | County of registration |
| `City` | TEXT | City of registration |
| `Electric Vehicle Type` | TEXT | BEV or PHEV |
| `Electric Range` | FLOAT | Range in miles (0 for PHEVs/unknown) |
| `CAFV Eligibility` | TEXT | Clean Alternative Fuel Vehicle eligibility status |
| `Postal Code` | TEXT | ZIP code |

### Engineered Columns (Feature Engineering)

| Column | Logic | Purpose |
|---|---|---|
| `ev_category` | Standardized from Electric Vehicle Type | BEV / PHEV clean labels |
| `vehicle_age` | `2026 - Model Year` | Age-based segmentation |
| `range_group` | Low (<100mi) / Medium (100–250mi) / High (>250mi) | Range tier classification |

### Pipeline Architecture

```
Raw CSV
   ↓
Python (Pandas) — Data Cleaning & Feature Engineering
   ↓
PostgreSQL — ETL Load via SQLAlchemy
   ↓
SQL Analysis — Window Functions, YOY Growth, Market Share
   ↓
Power BI — Interactive Dashboard
```

---

## 📌 3. Executive Summary

> **Dataset:** Washington State EV Registrations &nbsp;|&nbsp; **Records:** 279,780 vehicles &nbsp;|&nbsp; **Tool Stack:** Python → PostgreSQL → Power BI

### Key Metrics at a Glance

| Metric | Value |
|---|---|
| 🚗 Total Registered EVs | 280K |
| ⚡ BEV Market Share | **80%** |
| 🔋 PHEV Market Share | 20% |
| 📏 Avg Electric Range | 39.17 miles |
| 🏆 Market Leader | Tesla — **41%+ market share** |
| 📈 Peak Adoption Year | 2023 (~60K registrations) |

### Top 4 Business Insights

> ⚡ **BEVs dominate at 80% share** — the market has decisively shifted away from PHEVs, signalling accelerating infrastructure demand for charging networks over fuel stations

> 🚀 **EV adoption grew 3–4× after 2020** — a sharp post-2020 inflection driven by policy incentives, falling battery costs, and expanded model availability

> 🏆 **Tesla holds 41% market share with 115K vehicles** — the gap between Tesla (115K) and second-place Chevrolet (19K) reveals a highly concentrated market with limited top-tier competition

> 🗺️ **Adoption is concentrated in urban and progressive states** — top-state concentration signals significant whitespace for expansion in smaller cities and underserved markets

---

### 📸 Dashboard

![EV Market Intelligence Dashboard](dashboard_screenshot.png)

---

## 🔍 4. Insights Deep Dive

### Insight 1 — The Post-2020 EV Inflection Is Real and Structural

**Data:** Registrations grew from ~11K (2019) → ~14K (2020) → ~60K (2023) — a 3–4× surge in 3 years

This is not organic demand growth — it is **policy-triggered acceleration.** The post-2020 surge aligns directly with the US Federal EV tax credit expansion, California ZEV mandates, and major automakers committing to full EV lineups by 2030. The inflection is structural, not cyclical — meaning demand will continue compounding, not revert to pre-2020 baseline.

---

### Insight 2 — Tesla's 41% Market Share Signals a Winner-Take-Most Dynamic

**Data:**
| Manufacturer | Vehicles | Market Share |
|---|---|---|
| Tesla | 115K | ~41% |
| Chevrolet | 19K | ~7% |
| Nissan | 16K | ~6% |
| Ford | 15K | ~5% |
| KIA | 14K | ~5% |

The gap between Tesla and second place is not a lead — it is a **structural moat.** Tesla's 41% share vs. Chevrolet's 7% reflects compounding advantages in Supercharger network density, OTA software updates, and brand loyalty. Traditional OEMs are competing on hardware; Tesla competes on an integrated ecosystem.

---

### Insight 3 — BEV Dominance at 80% Makes Charging Infrastructure the #1 Investment Priority

**Data:** BEV = 80% share | PHEV = 20% share (from 279,780 registrations)

With 4 out of 5 registered EVs being fully battery-electric, the energy infrastructure requirement shifts dramatically. PHEVs can fall back on gasoline; BEVs cannot. An 80% BEV market means **charging network density is now a direct constraint on further EV adoption** — especially in suburban and rural areas where home charging is not always feasible.

---

### Insight 4 — Average Range of 39 Miles Reflects a Market in Transition

**Data:** AVG electric range = 39.17 miles across all 279,780 vehicles

This low average is explained by the large PHEV population (which typically has 20–50 mile electric range) and older BEV models in the registration pool. When segmented by range tier:
- **Low (<100mi):** Dominated by older models and all PHEVs
- **Medium (100–250mi):** Mainstream BEVs — Nissan Leaf, Chevy Bolt
- **High (>250mi):** Tesla Model Y, Model 3, and premium BEVs

The range distribution reveals that **most vehicles on the road today are not next-generation EVs** — they are early-adoption vehicles, which actually understates how good the current fleet is becoming.

---

### Insight 5 — Model Y and Model 3 Together Represent ~35% of the Entire Market

**Data:** Model Y = 60K | Model 3 = 38K | Combined = 98K out of 280K total

Two models from a single manufacturer represent more registrations than the entire Chevrolet, Nissan, Ford, and KIA EV fleets combined. This level of model-level concentration is **unprecedented in automotive history** and signals that Tesla's product strategy — fewer SKUs, higher volume — is outperforming the traditional OEM approach of proliferating model variants.

---

## 🎯 5. Recommendations

| Priority | Recommendation | Insight Basis | Expected Impact |
|---|---|---|---|
| 🔴 **Critical** | Invest in fast-charging infrastructure in top EV states immediately | BEV = 80% of market; charging is now the adoption bottleneck | Directly enables continued BEV growth; reduces range anxiety barrier |
| 🟠 **High** | Target suburban and smaller cities for next-wave EV incentive programs | Adoption concentrated in urban/progressive states — whitespace identified | Expands TAM; reduces geographic concentration risk |
| 🟠 **High** | Traditional OEMs should consolidate to 2–3 flagship EV models vs. spreading across many variants | Tesla's 2-model dominance outperforms multi-SKU OEM strategies | Higher per-model volume; stronger brand recognition; better unit economics |
| 🟡 **Medium** | Policy makers should extend CAFV incentives to Medium-range vehicles | Range segmentation shows medium-range BEVs are the largest addressable segment | Accelerates mainstream adoption beyond early adopters |
| 🟢 **Ongoing** | Build brand-specific BEV vs. PHEV strategy tracking | Company strategy analysis shows wide variation in BEV commitment across OEMs | Enables competitive benchmarking and manufacturer-level policy targeting |

---

## ⚠️ 6. Caveats & Assumptions

- **Washington State data only:** The dataset represents EV registrations from Washington State — one of the most EV-progressive states in the US. National averages would show lower BEV share and slower adoption curves. Findings should not be extrapolated to all US states without adjustment.
- **Recent year undercount:** YOY growth analysis shows apparent decline in 2024–2025. This is a **data completeness issue** — newer registrations are not fully captured in the dataset, not an actual market slowdown.
- **Electric range for PHEVs:** PHEVs show 0 or very low electric range values in the dataset. This artificially lowers the average range metric. Pure BEV average range would be significantly higher.
- **Vehicle age calculation:** `Vehicle Age = 2026 - Model Year` — assumes current year 2026. This is an approximation; actual age depends on exact registration date.
- **No sales price data:** The dataset does not include MSRP or transaction price. Premium vs. mass-market segmentation was inferred from brand positioning rather than price data.
- **Geographic scope:** City and county-level analysis is available but was not fully explored. A deeper geographic drill-down could reveal intra-state adoption patterns.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python (Pandas)** | Data ingestion, cleaning, null handling, feature engineering |
| **PostgreSQL** | ETL destination, SQL analysis layer |
| **SQLAlchemy + psycopg2** | Python-to-PostgreSQL connection and query execution |
| **SQL Window Functions** | YOY growth (LAG), market share (SUM OVER), top models (ROW_NUMBER PARTITION BY) |
| **Power BI Desktop** | Interactive dashboard — KPI cards, bar charts, donut chart, map, trend line |
| **Jupyter Notebook** | End-to-end analysis workflow documentation |

---

## 🧪 SQL Highlights

**Year-over-Year Growth with Window Function:**
```sql
SELECT
    "Model Year",
    COUNT(*) AS total,
    LAG(COUNT(*)) OVER (ORDER BY "Model Year") AS prev_year,
    ROUND(
        (COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY "Model Year")) * 100.0
        / LAG(COUNT(*)) OVER (ORDER BY "Model Year"),
    2) AS yoy_growth
FROM ev_data
GROUP BY "Model Year"
ORDER BY "Model Year";
```

**Market Share with Analytical Function:**
```sql
SELECT
    "Make",
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS market_share
FROM ev_data
GROUP BY "Make"
ORDER BY total DESC
LIMIT 10;
```

**Top 3 Models Per Manufacturer (PARTITION BY):**
```sql
SELECT * FROM (
    SELECT
        "Make", "Model",
        COUNT(*) AS total,
        ROW_NUMBER() OVER (PARTITION BY "Make" ORDER BY COUNT(*) DESC) AS rank
    FROM ev_data
    GROUP BY "Make", "Model"
) sub
WHERE rank <= 3
ORDER BY "Make", rank;
```

---

## 📁 Repository Structure

```
ev-market-intelligence/
│
├── 📊 Dashboard.pbix                  ← Power BI dashboard file
├── 📄 EVision_Analytics.pdf           ← PDF export of dashboard
├── 🖼️ dashboard_screenshot.png        ← Dashboard preview image
│
├── 🐍 ev_data_cleaning.ipynb          ← Data cleaning & feature engineering
├── 🐍 ev_etl_and_sql_analysis.ipynb   ← ETL pipeline + SQL analysis in Python
├── 🗄️ ev_postgresql_queries.sql       ← All standalone SQL queries
│
├── LICENSE
└── README.md
```

---

## 👤 Connect With Me

If you found this project useful or want to discuss data analytics, feel free to reach out!

> 📬 [LinkedIn](https://www.linkedin.com/in/seema-kumari-375763308/) &nbsp;|&nbsp; 💼 [GitHub Portfolio](https://github.com/seema-kri) &nbsp;|&nbsp; 
---

*Built to demonstrate a full analyst stack — Python for cleaning, PostgreSQL for analysis, Power BI for storytelling — applied to a real-world automotive market dataset.*
