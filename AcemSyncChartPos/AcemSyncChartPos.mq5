//+------------------------------------------------------------------+
//|                                             AcemSyncChartPos.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#include <Acem/Sync/AcemSyncChartPos.mqh>

CAcemSyncChartPos syncChartPos;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   syncChartPos.init();
//---
   return(INIT_SUCCEEDED);
  }
  
void OnDeinit(const int  reason)
{
    syncChartPos.deinit(reason);
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   syncChartPos.OnChartEvent(id, lparam, dparam, sparam);
  }
//+------------------------------------------------------------------+
