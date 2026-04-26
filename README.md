# 📊 Call Center Performance Analysis  
### End-to-End Data Analytics Project | Excel · SQL · Power BI  

## 📖 Project Overview  

This project focuses on analyzing call center operations to improve **service efficiency, SLA compliance, and customer experience**.

The solution was built end-to-end using:

- Excel → Data cleaning & KPI validation  
- SQL → Data transformation & KPI computation  
- Power BI → Dashboard & insights generation  

The final output is a **5-page interactive dashboard** designed for operations teams and leadership.

## 🎯 Business Problem  

Call center operations were facing multiple critical challenges:

- ❌ No centralized visibility of performance  
- ⚠️ SLA breaches going unnoticed  
- 😕 No clarity on customer satisfaction drivers  
- 📉 Hidden inefficiencies in agent performance  

👉 As a result, decisions were reactive instead of data-driven.

## 🧠 Project Objective  

- Build an **end-to-end analytics solution**  
- Track key KPIs: SLA %, AHT, FRT, CSAT, FCR  
- Identify operational bottlenecks  
- Generate actionable insights for improvement  

## 🗂 Data Overview  

- **Channels:** Voice, Chat, Email  
- **Time Period:** Feb – March 2026  
- **Dataset:** Thousands of ticket-level records  
- **Key Fields:**  
  - Created_At  
  - First_Response_At  
  - Resolved_At  
  - Channel  
  - Agent  
  - Wait_Time  

## 🛠 Tools & Technologies  

| Tool | Purpose |
|------|--------|
| Excel | KPI validation & data cleaning |
| SQL | Data transformation & KPI logic |
| Power BI | Dashboard & visualization |
| DAX | KPI calculations |

## 🔄 Solution Approach  

1. Data Cleaning & Validation (Excel)  
2. KPI Definition & Calculation  
3. SQL-Based Transformation  
4. Cross-Validation Across Tools  
5. Power BI Dashboard Development  
6. Insight Generation  

# 📊 Dashboard Structure  

| Page | Focus |
|------|------|
| 1 | Executive Overview |
| 2 | Operational Efficiency |
| 3 | Performance & SLA |
| 4 | Customer Experience |
| 5 | Agent Performance |

# 📸 Dashboard Insights  

## 📌 Executive Overview 

<img width="1517" height="855" alt="Executive Overview" src="https://github.com/user-attachments/assets/6fa355a2-6137-4b69-812c-7fd724842d8a" />

### Key Metrics  

- **SLA Compliance:** ~40%  
- **SLA Breach Rate:** ~60%  
- **Average CSAT:** 3.7 / 5  
- **Dominant Channel:** Voice  

### Insights  

- 🔴 **SLA is critically low (~40%)**  
  → Nearly **6 out of 10 tickets are breaching SLA**

- 📞 **Voice dominates workload**  
  → Highest ticket volume across all channels  

- 🔁 **Reopen rate indicates quality issues**  
  → Many tickets are not resolved in first attempt  

## 📌 Operational Efficiency    

<img width="1518" height="854" alt="Operational Efficiency" src="https://github.com/user-attachments/assets/63c870ac-b6c9-4882-9fbc-762c4efa61f4" />

### Key Metrics  

- **Voice Resolution Time:** ~0.7 hours  
- **Chat Resolution Time:** ~1.7 hours  
- **Email Resolution Time:** ~16.52 hours  

### Insights  

- 📧 **Email is the biggest bottleneck**  
  → Takes **4–5× longer than Voice**

- ⏱ **FRT is slow across channels**  
  → Delayed first response impacts SLA directly  

- 💬 **Chat wait times are high**  
  → Poor real-time experience  

## 📌 Performance & SLA   

<img width="1516" height="854" alt="Performance Analysis" src="https://github.com/user-attachments/assets/0effe010-3378-4958-b524-b890de28c72a" />

### Key Metrics  

- **SLA Compliance:** ~40%  
- **SLA Breach Rate:** ~59%  
- **FCR:** ~50%  
- **Resolution Rate:** High but delayed  

### Insights  

- 🔴 **~59% tickets breach SLA**  
  → Major operational risk  

- 🔁 **FCR is low (~50%)**  
  → Half of issues require follow-up  

- 📊 **Channel-wise SLA varies**  
  → Email & Chat drive most breaches  

## 📌 Customer Experience   

<img width="1522" height="858" alt="Customer Experience" src="https://github.com/user-attachments/assets/368b3951-c2cd-4344-8cd6-28b9c728b6f7" />

### Key Metrics  

- **Average CSAT:** 3.7 / 5  
- **Voice CSAT:** ~3.8  
- **Chat CSAT:** ~3.8 
- **Email CSAT:** ~3.3  

### Insights  

- 📧 **Email has lowest CSAT (~3.3)**  
  → Strong correlation with slow resolution  

- ⚠️ **DSAT is significant**  
  → Negative experience mainly from email  

- 📞 **Voice performs best**  
  → Fast response → higher satisfaction  

## 📌 Agent Performance  

<img width="1520" height="856" alt="Team Performance" src="https://github.com/user-attachments/assets/b9a89948-32e0-4c0c-8231-a4fbbe3c0e86" />

### Insights  

- 🏆 **Top vs Bottom gap is large**  
  → Top agents significantly outperform others  

- ⚖️ **Workload imbalance exists**  
  → Some agents overloaded, others underutilized  

- 📉 **Underperformers identified**  
  → Higher AHT + lower FCR  

# 🔍 Key Insights  

- 📧 Email channel is the biggest bottleneck  
- ⏱ SLA issues are driven by delay, not volume  
- 🔁 Low FCR (~50%) increases workload  
- 📊 Chat & Email underperform vs Voice  
- 👨‍💻 Agent performance varies significantly  
- 😊 CSAT is moderate but at risk  

# 💡 Recommendations  

### 1. Improve Email Handling  
- Reduce resolution time by **40–50%** using templates & routing  

### 2. SLA-Based Prioritization  
- Auto-flag tickets nearing breach  
- Introduce urgency scoring  

### 3. Improve FCR  
- Agent training on common issues  
- Knowledge base improvements  

### 4. Optimize Workload  
- Smart routing based on capacity  

### 5. Real-Time Monitoring  
- Live SLA dashboards & alerts  

# 🚀 Expected Business Impact  

- 📈 SLA improvement: **40% → 70–80%**  
- 😊 CSAT improvement: **3.7 → 4.2+**  
- ⚡ Faster resolution across channels  
- 👥 Better resource utilization  

# ⚠️ Challenges Faced  

- Data inconsistencies (missing timestamps)  
- KPI mismatch across tools  
- Large dataset handling  
- Designing meaningful visuals  

# 📚 Key Learnings  

- KPI validation is critical  
- Cross-tool consistency matters  
- Business context drives analysis  
- Dashboards must tell a story  

# 🔮 Future Enhancements  

- Predictive SLA breach model  
- ML-based prioritization  
- Real-time dashboards  
- AI-driven automation  

# 📁 Project Structure  

📦 Call-Center-Analysis  
 ┣ 📂 Excel  
 ┣ 📂 SQL  
 ┣ 📂 PowerBI  
 ┣ 📂 Screenshots  
 ┣ 📜 README.md  

## ✅ Conclusion  

- This project demonstrates how call center data can be transformed into **actionable insights** using Excel, SQL, and Power BI.
- It highlights operational inefficiencies, improves decision-making, and enables data-driven performance optimization.
