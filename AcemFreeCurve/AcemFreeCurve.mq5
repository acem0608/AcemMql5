//+------------------------------------------------------------------+
//|                                                AcemFreeCurve.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

#include <Acem/Draw/AcemFreeCurve.mqh>
#include <Acem/Common/AcemUtility.mqh>

#define INDICATOR_SHORT_NAME "AcemSyncChartPos"

CAcemFreeCurve freeCurve;

int OnInit()
{
    //--- indicator buffers mapping
    IndicatorSetString(INDICATOR_SHORTNAME, INDICATOR_SHORT_NAME);
    long chartId = ChartID();
    if (isSameIndicator(chartId, INDICATOR_SHORT_NAME))
    {
        return (INIT_FAILED);
    }
    ChartSetInteger(chartId, CHART_EVENT_MOUSE_MOVE, true);

    freeCurve.init();

    //---
    return (INIT_SUCCEEDED);
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
    return (rates_total);
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
    freeCurve.OnChartEvent(id, lparam, dparam, sparam);
}
//+------------------------------------------------------------------+
