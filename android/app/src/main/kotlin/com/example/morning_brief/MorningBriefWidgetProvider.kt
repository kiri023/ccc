package com.example.morning_brief

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

class MorningBriefWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        appWidgetIds.forEach { widgetId ->
            val widgetData = HomeWidgetPlugin.getData(context)
            val recommendation = widgetData.getString("recommendation", "앱에서 새로고침하세요")
            val topSchedule = widgetData.getString("topSchedule", "오늘 일정 없음")

            val views = RemoteViews(context.packageName, R.layout.morning_brief_widget).apply {
                setTextViewText(R.id.widget_recommendation, recommendation)
                setTextViewText(R.id.widget_schedule, topSchedule)
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
