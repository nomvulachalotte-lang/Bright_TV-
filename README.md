# Bright_TV-
Analysis of Bright_TV viewer and sales data to identify popular shows and improve business decisions.

## 📌 Overview

BrightTV's CEO wants to grow the company's subscription base this financial year. This project analyzes user profile and viewer transaction data to provide insights that will assist the CVM (Customer Value Management) team in meeting that objective.

## 🎯 Objective

- Insights on user and usage trends of BrightTV
- Factors that influence consumption
- Content recommendations to increase consumption on low-consumption days
- Initiatives to grow BrightTV's user base further

## 📂 Dataset

- **User profiles** – subscriber-level information
- **Viewer transactions** – session-level consumption data

### Data Notes
- ⏰ Times and dates are supplied in **UTC** and must be converted to **South African (SA) time**.
- 🎬 Consumption is recorded **per session** — each subscriber session generates one record.
- ➕ Additional/external data (e.g. public holidays, load-shedding schedules, sporting events) is welcome to enrich the analysis.

## 🗂️ Project Structure

```
├── 01-data-processing/
│   ├── raw/                          # Original user profile & transaction data
│   ├── cleaning-transformation.sql   # UTC → SA time conversion, joins, cleaning
│   └── processed/                    # Cleaned, analysis-ready datasets
├── 02-analysis/
│   └── brighttv_analysis.xlsx        # Pivot tables, trends, charts
├── 03-presentation/
│   └── brighttv_presentation.pptx    # 20-min CEO/CVM presentation
└── README.md
```

## 🔄 Suggested Workflow

### 1. Data Preparation
- Convert all UTC timestamps to SA time (UTC+2).
- Join user profile data with session-level transaction data.
- Clean and validate fields (e.g. missing values, duplicate sessions, invalid dates).

### 2. Analysis
- **Usage trends:** consumption by day of week, time of day, and over time.
- **User trends:** active vs. inactive subscribers, session frequency, demographic patterns (if available).
- **Consumption drivers:** content type/genre, device, day type (weekday/weekend/holiday), time slot.
- **Low-consumption days:** identify patterns and gaps to target with content or promotions.

### 3. Recommendations
- Content strategy to lift consumption on low-activity days.
- Initiatives to grow the subscriber base (e.g. targeted promotions, bundling, content acquisition, engagement campaigns).

### 4. Presentation
- Structured as a 20-minute deck for the CEO/CVM team:
  1. Executive summary
  2. User & usage trends
  3. Key consumption drivers
  4. Content recommendations
  5. Growth initiatives
  6. Next steps

## 📤 Deliverables

- ✅ Cleaned/processed dataset with SA-time conversion
- ✅ SQL / analysis code used for transformations
- ✅ Spreadsheet with pivot tables & charts
- ✅ Final PowerPoint presentation (20 minutes)

## 📈 Key Insights

- **Peak usage times/days:**
- **Key factors influencing consumption:**
- **Low-consumption day patterns:**
- **Content recommendations:**
- **Growth initiative recommendations:**
