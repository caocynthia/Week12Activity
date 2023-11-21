/**
 * @description Find functions that call pressActionKey
 * @kind problem
 * @id javascript/tests-calling-pressActionKey
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test that calls the function "pressActionKey".
 */

predicate callsPressActionKey(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee and
    callee.getName() = "pressActionKey"
  )
}

from Function caller, Function callee
where callsPressActionKey(caller, callee)
select caller, "calls pressActionKey"
