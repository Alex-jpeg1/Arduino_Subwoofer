#include "Task.hpp"

Task::Task(void* context, Priority priority, void(*RunTaskProc)(void*), void(*StopTaskProc)(void*)):
    _priority(priority)
{
    _objContext = context;
    RunTask = RunTaskProc;
    StopTask = StopTaskProc;
}