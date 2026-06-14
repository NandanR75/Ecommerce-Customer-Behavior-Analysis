import pandas as pd
import numpy as np
import os

def run_advanced_pipeline(orders_csv="Orders.csv", details_csv="Details.csv"):
    print("🚀 Booting Enterprise Preprocessing Pipeline...")
    
    if not os.path.exists(orders_csv) or not os.path.exists(details_csv):
        print("❌ Error: Orders.csv or Details.csv not found!")
        return
        
    orders = pd.read_csv(orders_csv)
    details = pd.read_csv(details_csv)
    
    orders.dropna(subset=['Order ID'], inplace=True)
    details.dropna(subset=['Order ID'], inplace=True)
    
    orders['Order Date'] = pd.to_datetime(orders['Order Date'], format='%d-%m-%Y')
    
    for col in ['CustomerName', 'State', 'City']:
        orders[col] = orders[col].astype(str).str.strip()
    for col in ['Category', 'Sub-Category', 'PaymentMode']:
        details[col] = details[col].astype(str).str.strip()
        
    orders.to_csv("Cleaned_Orders.csv", index=False)
    details.to_csv("Cleaned_Details.csv", index=False)
    print("✅ Success! Cleaned_Orders.csv and Cleaned_Details.csv have been created!")

if __name__ == "__main__":
    run_advanced_pipeline(orders_csv="Orders.csv", details_csv="Details.csv")
