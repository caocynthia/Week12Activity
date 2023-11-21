/**
 * @description Two queries to confirm that they run as expected
 * @kind problem
 * @id javascript/functions-atmost-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is at most 10 lines.
 */
predicate atMostTenLines(Function f) {
  exists(f.getNumLines() < 11)
}

from Function f
where atMostTenLines
select f, "is at most 10 lines"
