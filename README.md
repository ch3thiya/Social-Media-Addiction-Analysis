# 📱 Social Media Addiction Analysis 2025

Does social media usage actually hurt students, or is it just the "addiction mindset"?

---

## 📌 Project Overview

This project analyzes a dataset of 700 students to determine the tangible impact of social media on mental health and sleep efficiency. By simulating a real-world business analysis, I moved beyond simple aggregations to perform segmentation analysis and threshold detection.  

**The Goal:** Identify actionable "usage thresholds" and determine if specific demographics are more vulnerable to digital addiction.

---

## 🛠️ The Approach

To ensure accurate results, I performed a full data lifecycle analysis. I cleaned the raw dataset and utilized SQL techniques such as segmentation and statistical binning to group users effectively. I then conducted a demographic drill-down along with popularity and toxicity analyses to rigorously test the hypothesis that social media addiction directly correlates with reduced sleep quality and mental health scores.

---

## 📊 Key Findings

### 1. The "Tipping Point" is 4.0 Hours

Usage under 3.5 hours has a negligible impact on health. However, a sharp decline begins at the 4-hour mark.

- **< 3.5 Hours:** Mental Health Score remains steady at ~7.5 - 8.0.  
- **@ 4.0 Hours:** Score drops to 6.8 (Sleep drops to 7.7 hrs).  
- **@ 5.0 Hours:** Score plummets to 6.1 (Sleep drops to 6.6 hrs).  

---

### 2. The Hidden Cost of Addiction

Students in the "High Addiction" tier (Score > 7) suffer massive penalties compared to casual users:

| Metric            | Low Addiction Users | High Addiction Users | Impact           |
|------------------|------------------|-------------------|----------------|
| Avg Mental Health | 8.06 / 10        | 5.43 / 10         | -32% Decline    |
| Avg Sleep         | 8.14 Hours       | 6.21 Hours        | -1.9 Hours/Night |

---

### 3. The Gender Disparity

Females appear more susceptible to sleep loss due to addiction than males:

- **Females:** "High Addiction" users lose 2.3 hours of sleep compared to their "Low Addiction" peers (8.35h vs 6.02h).  
- **Males:** "High Addiction" users lose 1.2 hours of sleep compared to their "Low Addiction" peers (7.62h vs 6.39h).  

---

### 4. Platform Analysis: Toxicity vs. Reach

I analyzed which platforms are most popular versus which ones breed the highest addiction scores:

- **Most Addictive:** Users of Snapchat and WhatsApp reported the highest average addiction scores.  
- **Most Popular:** Instagram is the most widely used platform among the students.  
- **Least Toxic:** Line and YouTube users reported the lowest addiction levels.  

**Insight:** While Instagram has the reach, the deeper "addiction" behavior is driven by messaging-centric apps (Snapchat/WhatsApp).

---

## 📢 Recommendation

Based on the data, the path to digital wellness involves both time management and platform awareness:

- **The "Safe Zone":** Daily usage of under 3.5 hours correlates with healthy sleep patterns (>8 hours) and high mental health scores.  
- **Platform Warning:** Students should be particularly mindful when using Snapchat and WhatsApp. These platforms show the highest correlation with addictive behaviors, likely due to their high-frequency notification mechanics (streaks, instant replies).  
- **Targeted Support:** Female students show a steeper decline in sleep quality (-2.3 hours) compared to males (-1.2 hours) as addiction rises. Wellness programs should prioritize sleep hygiene specifically for female students.
