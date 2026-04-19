# E-commerce User Behavior Analysis

## Overview

This project analyzes user behavior from an e-commerce dataset using SQL to understand how users move through the purchase funnel and identify key patterns in conversion.

---

## Objective

The goal of this analysis is to:

* Build a user conversion funnel (view → cart → purchase)
* Measure conversion rates
* Identify drop-off points in the customer journey
* Detect inconsistencies or anomalies in user behavior

---

## Dataset

* Source: Kaggle (E-commerce behavior dataset)
* Contains user interaction events including:

  * product views
  * add-to-cart actions
  * purchases
* Each row represents a user event

---

## Key Analysis

### 1. Funnel Analysis

Calculated the number of unique users at each stage:

* Viewed products: 5,294 users
* Added to cart: 139 users
* Purchased: 242 users

---

### 2. Conversion Rates

* View → Cart: **2.63%**
* View → Purchase: **4.57%**

---

### 3. Key Findings

#### Funnel Inconsistency

The number of users who made a purchase exceeds those who added items to cart.

* ~69% of purchasers did not have a recorded cart event
* This suggests:

  * incomplete tracking of cart events
  * or a direct purchase flow bypassing cart

---

#### Category-Level Insights

User behavior varies significantly across product categories:

* Electronics (e.g., smartphones) drive the highest number of purchases
* Some categories show purchases with little or no cart activity
* Conversion rates vary widely across categories

---

#### Small Sample Bias

Some categories show high conversion rates (e.g., 33%), but are based on very small sample sizes (3–5 users), making them unreliable.

---

## SQL Techniques Used

* `CASE WHEN` for conditional logic
* `COUNT(DISTINCT ...)` for unique user tracking
* Aggregations for funnel metrics
* Grouping by category for segmentation
* Conversion rate calculations

---

## Conclusion

This analysis highlights how users interact with an e-commerce platform and reveals inconsistencies in the purchase funnel. The findings suggest potential gaps in event tracking and demonstrate the importance of validating data quality when analyzing user behavior.

---

## Files

* `ecommerce_user_behavior_analysis.sql` → contains all queries used in the analysis
