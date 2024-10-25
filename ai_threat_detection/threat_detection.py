from sklearn.ensemble import IsolationForest
import pandas as pd

# Load log data and train an anomaly detection model
logs = pd.read_csv('logs.csv')
model = IsolationForest(contamination=0.01).fit(logs)

# Detect anomalies
logs['anomaly'] = model.predict(logs)
print(logs[logs['anomaly'] == -1])
