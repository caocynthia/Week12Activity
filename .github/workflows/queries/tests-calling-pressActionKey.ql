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
predicate callsPressActionKey(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1) and
    it.getName() = "pressActionKey"
  )
}

from Function test
where callsPressActionKey(function)
select test, "calls pressActionKey"
