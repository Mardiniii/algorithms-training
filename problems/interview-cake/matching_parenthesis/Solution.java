import org.junit.Test;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import java.util.*;
import java.util.Deque;
import java.util.ArrayDeque;

import static org.junit.Assert.*;

public class Solution {
    public static int getClosingParen(String sentence, int openingParenIndex) {
        Deque<Character> parenStack = new ArrayDeque<>();

        for (int i = openingParenIndex; i < sentence.length(); i++) {
            Character character = sentence.charAt(i);

            if (character == '(') {
                parenStack.push(character);
            } else if (character == ')') {
                parenStack.pop();
                if (parenStack.isEmpty()) return i;
            }
        }

        throw new NoSuchElementException("Not close parenthesis");
    }

    // tests

    @Test
    public void allOpenersThenClosersTest() {
        final int expected = 7;
        final int actual = getClosingParen("((((()))))", 2);
        assertEquals(expected, actual);
    }

    @Test
    public void mixedOpenersAndClosersTest() {
        final int expected = 10;
        final int actual = getClosingParen("()()((()()))", 5);
        assertEquals(expected, actual);
    }

    @Test(expected = Exception.class)
    public void noMatchingCloserTest() {
        getClosingParen("()(()", 2);
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
