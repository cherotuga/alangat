---
title: "County Department Finances FY 2023/24"
description: "Analysis of Controller of Budget data on county budgets, exchequer releases and expenditure"
author: "[Your Name/Organization]"
date: "2025-01-01"
format: pdf
---

## Dataset Overview

This documentation describes the analysis of financial data from Kenya's Controller of Budget (CoB) for fiscal year 2023/24, covering county budgets, exchequer releases, and expenditure.

### Key Information
- **Size**: 74KB
- **Records**: 768 entries
- **Format**: CSV
- **Time Period**: 2023-2024
- **Last Updated**: January 1, 2025
- **Source**: Controller of Budget, Kenya

## Data Structure

### Schema

```{r}
#| echo: false
#| eval: true

data <- read.csv("county-finances-sep2024.csv")
head(data) %>%
  kable() %>%
  kable_styling()
```

### Variables

Each record includes:
- County name
- Department
- Budget allocation
- Exchequer releases
- Actual expenditure
- Absorption rate

## Data Quality Notes

The analysis in this document uses data from the Controller of Budget's reports. Users should note:
- Budget figures may be revised
- Expenditure reporting can have delays
- County submission completeness varies

## Usage Guidelines

### Data Source
Original data: [Controller of Budget Reports](https://cob.go.ke/reports/consolidated-county-budget-implementation-review-reports/)

### Files
- Source data: [CSV file](/data/county-finances-sep2024.csv)
- Original report: [PDF documentation](/docs/county-finances-sep24.pdf)

### Attribution
This analysis uses data from the Controller of Budget, Kenya.

## Analysis Contact

For questions about this analysis, contact:
[Your contact information]