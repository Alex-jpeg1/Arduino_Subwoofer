#pragma once
#ifndef TASKS_H
#define TASKS_H

enum class Priority
{
    HIGH,
    MEDIUM,
    LOW
};

class Task
{
    public:
        Task(void* context, Priority priority, void(*RunTaskProc)(void*), void(*StopTaskProc)(void*));
        void (*RunTask)(void *);
        void (*StopTask)(void *);
    private:
        void* _objContext;
        Priority _priority;
};

#endif