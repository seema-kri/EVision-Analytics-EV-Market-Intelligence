# 📊 PhonePe Payment Analytics Dashboard

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat-square&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-F2C811?style=flat-square&logo=powerbi&logoColor=black)
![Transactions](https://img.shields.io/badge/Transactions-300K-1D9E75?style=flat-square)
![Volume](https://img.shields.io/badge/Volume-₹3.3B-1D9E75?style=flat-square)
![Domain](https://img.shields.io/badge/Domain-FinTech-555?style=flat-square)

> **₹102M in annual failed loan value. 5 action-ready fixes. No further analysis needed.**  
> A Power BI dashboard across 300K PhonePe transactions that turns failure data into a prioritised business decision.

---

## 📸 Dashboard Preview

<!-- Add your dashboard screenshot here -->
<!-- ![PhonePe Dashboard](Dashboard.png) -->

---

## 🎯 The Business Questions

- What is the #1 cause of transaction failures across all service verticals?
- How much revenue is lost annually due to failed transactions?
- Which vertical has the highest failure rate — and what does it cost?
- What should the team fix first?

---

## 💡 Key Findings

| Finding | Number |
|--------|--------|
| Transactions analysed | **300,000** |
| Total transaction volume | **₹3,333M** |
| #1 failure cause | **Server errors (~34% of all failures)** |
| Annual failed Loan value | **₹102M** |
| Loan vertical failure rate | **4.05% on ₹2,532M total** |
| Action-ready recommendations delivered | **5** |

---

## 📐 Data Model

```
5 Service Verticals
├── Money Transfer
├── Loans          ← highest failure value (₹102M lost)
├── Insurance
├── Bills & Recharge
└── Merchant Payments

Failure Categories
├── Server Errors  ← #1 cause (~34%)
├── Timeout
├── User Errors
└── Other
```

---

## 🔧 DAX Measures Used

```dax
-- Failed transaction value by vertical
Failed_Loan_Value =
CALCULATE(
    SUM(Transactions[Amount]),
    Transactions[Vertical] = "Loans",
    Transactions[Status] = "Failed"
)

-- Failure rate %
Failure_Rate =
DIVIDE(
    COUNTROWS(FILTER(Transactions, Transactions[Status] = "Failed")),
    COUNTROWS(Transactions),
    0
)
```

---

## 🎯 Recommendations Delivered

| Priority | Recommendation |
|----------|---------------|
| 🔴 Critical | Fix server infrastructure — root cause of 34% of all failures |
| 🔴 Critical | Prioritise Loan vertical — ₹102M annual loss is highest absolute value |
| 🟠 High | Add retry logic for server errors to recover failed transactions automatically |
| 🟠 High | Real-time alerting when server error rate exceeds threshold |
| 🟡 Medium | User-facing error messages to reduce user-error failures |

---

## 📁 Repository Structure

```
PhonePe-Business-Intelligence-Dashboard/
├── 📊 PhonePe_Dashboard.pbix   ← Power BI dashboard file
├── 📋 PhonePe_Data.xlsx        ← Source transaction data
├── 🖼️ Dashboard.png            ← Dashboard preview
└── README.md
```

---

## 🛠️ Tools & Methods

| Tool | Purpose |
|------|---------|
| Power BI | Dashboard, cross-table relationships, slicers |
| DAX | Custom measures, failure rate calculations, vertical analysis |
| Excel | Data preparation and validation |

---

## 🤝 Connect

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Seema%20Kumari-0A66C2?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/seema-kumari-375763308/)
[![Email](https://img.shields.io/badge/Email-seemakri136@gmail.com-EA4335?style=flat-square&logo=gmail&logoColor=white)](mailto:seemakri136@gmail.com)
[![Portfolio](https://img.shields.io/badge/GitHub-seema--kri-181717?style=flat-square&logo=github)](https://github.com/seema-kri)
