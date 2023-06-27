//+------------------------------------------------------------------+
//|                                               AcemSyncObject.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#include <Acem/Common/AcemUtility.mqh>
#include <Acem/Sync/AcemSyncObject.mqh>

#define INDICATOR_SHORT_NAME "AcemSyncObject"

CAcemSyncObject syncObj(INDICATOR_SHORT_NAME);

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
    IndicatorSetString(INDICATOR_SHORTNAME, INDICATOR_SHORT_NAME);
    long chartId = ChartID();
    if (isSameIndicator(chartId, INDICATOR_SHORT_NAME))
    {
        return (INIT_FAILED);
    }

    //--- indicator buffers mapping
    ChartSetInteger(chartId, CHART_EVENT_MOUSE_MOVE, true);
    ChartSetInteger(chartId, CHART_EVENT_OBJECT_CREATE, true);
    ChartSetInteger(chartId, CHART_EVENT_OBJECT_DELETE, true);
    //---
    
    syncObj.init();
//---
   return(INIT_SUCCEEDED);
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

void OnDeinit(const int reason)
{
    syncObj.deinit(reason);
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
     syncObj.OnChartEvent(id, lparam, dparam, sparam);
  }
//+------------------------------------------------------------------+
