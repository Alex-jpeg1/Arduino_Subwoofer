#pragma once
#ifndef STATEMACHINE
#define STATEMACHINE

#include "../Tasks/Task.hpp"

enum class SystemState
{
    SYSTEM_IDLE,
    SYSTEM_INIT,
    SYSTEM_PROCESSING,
    SYSTEM_ERROR
};

class StateMachine
{
    public:
        StateMachine(Task audioTask);
        void Init(void); /* Init function */

    private:
        Task audioTask;
        static void RunStateMachine(void); /* The main cycle of the state machine*/
        void UpdateState(void);
        void TansitionState(SystemState newState);
};

#endif