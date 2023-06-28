//+------------------------------------------------------------------+
//|                                                  Investigate.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

input bool bCharteventKeydown = false;
input bool bCharteventMouseMove = false;
input bool bCharteventObjectCreate = true;
input bool bCharteventObjectChange = true;
input bool bCharteventObjectDelete = true;
input bool bCharteventClick = false;
input bool bCharteventObjectClick = false;
input bool bCharteventObjectDrag = false;
input bool bCharteventObjectEndEdit = false;
input bool bCharteventChartChange = false;
input bool bCharteventCustom = true;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
    ChartSetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE, true);
    ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE, true);
    ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_DELETE, true);
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
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
   switch (id) {
   case CHARTEVENT_KEYDOWN:
   {
    if (bCharteventKeydown) {
      Print("CHARTEVENT_KEYDOWN:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_MOUSE_MOVE:
   {
    if (bCharteventMouseMove) {
      Print("CHARTEVENT_MOUSE_MOVE:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_OBJECT_CREATE:
   {
    if (bCharteventObjectCreate) {
      Print("CHARTEVENT_OBJECT_CREATE:"+lparam+":"+dparam+":"+sparam);
   }
   }
   break;
   case CHARTEVENT_OBJECT_CHANGE:
   {
    if (bCharteventObjectChange) {
      Print("CHARTEVENT_OBJECT_CHANGE:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_OBJECT_DELETE:
   {
    if (bCharteventObjectDelete) {
      Print("CHARTEVENT_OBJECT_DELETE:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_CLICK:
   {
    if (bCharteventClick) {
      Print("CHARTEVENT_CLICK:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_OBJECT_CLICK:
   {
    if (bCharteventClick) {
      Print("CHARTEVENT_OBJECT_CLICK:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_OBJECT_DRAG:
   {
    if (bCharteventObjectDrag) {
      Print("CHARTEVENT_OBJECT_DRAG:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_OBJECT_ENDEDIT:
   {
    if (bCharteventObjectEndEdit) {
      Print("CHARTEVENT_OBJECT_ENDEDIT:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_CHART_CHANGE:
   {
    if (bCharteventChartChange) {
      Print("CHARTEVENT_CHART_CHANGE:"+lparam+":"+dparam+":"+sparam);
    }
   }
   break;
   case CHARTEVENT_CUSTOM:
   {
    if (bCharteventCustom) {
      Print("CHARTEVENT_CUSTOM");
      Print(lparam);
      Print(dparam);
      Print(sparam);
    }
   }
   break;
   default:
   {
    if (true) {
      Print("default");
      Print(id);
      Print(lparam);
      Print(dparam);
      Print(sparam);
    }
   }
   break;
   }
  }
//+------------------------------------------------------------------+
