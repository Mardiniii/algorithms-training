import org.junit.Test;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import java.util.*;

import static org.junit.Assert.*;

public class Solution {


    public static boolean isValid(String code) {
        Map<Character, Character> closerByOpener = new HashMap<>();
        closerByOpener.put('{', '}');
        closerByOpener.put('[', ']');
        closerByOpener.put('(', ')');

        Set<Character> openers = closerByOpener.keySet();
        Set<Character> closers = new HashSet<>(closerByOpener.values());

        Deque<Character> stack = new ArrayDeque<>();

        for (Character currentChar : code.toCharArray()) {
            if (openers.contains(currentChar)) {
                stack.push(currentChar);
            } else if (closers.contains(currentChar)) {
                if (stack.isEmpty()) {
                    return false;
                } else {
                    char lastUnclosedOpener = stack.pop();

                    if (closerByOpener.get(lastUnclosedOpener) != currentChar) return false;
                }
            }
        }

        return stack.isEmpty();
    }

    // tests

    @Test
    public void validShortCodeTest() {
        final boolean result = isValid("()");
        assertTrue(result);
    }

    @Test
    public void validLongerCodeTest() {
        final boolean result = isValid("([]{[]})[]{{}()}");
        assertTrue(result);
    }

    @Test
    public void mismatchedOpenerAndCloserTest() {
        final boolean result = isValid("([][]}");
        assertFalse(result);
    }

    @Test
    public void interleavedOpenersAndClosersTest() {
        final boolean result = isValid("([)]");
        assertFalse(result);
    }

    @Test
    public void missingCloserTest() {
        final boolean result = isValid("[[]()");
        assertFalse(result);
    }

    @Test
    public void extraCloserTest() {
        final boolean result = isValid("[[]]())");
        assertFalse(result);
    }

    @Test
    public void emptyStringTest() {
        final boolean result = isValid("");
        assertTrue(result);
    }

    public static void main(String[] args) {
        Result result = JUnitCore.runClasses(Solution.class);
        for (Failure failure : result.getFailures()) {
            System.out.println(failure.toString());
        }
        if (result.wasSuccessful()) {
            System.out.println("All tests passed.");
        }
    }
}
