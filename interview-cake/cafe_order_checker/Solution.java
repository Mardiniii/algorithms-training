import org.junit.Test;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import static org.junit.Assert.*;

public class Solution {

    public static boolean isFirstComeFirstServed(int[] takeOut, int[] dineIn, int[] servedOrders) {
        int takeOutIndex = 0;
        int dineInIndex = 0;

        // check if we're serving orders first-come, first-served
        for (int order : servedOrders) {
            if (takeOutIndex < takeOut.length && takeOut[takeOutIndex] == order) {
                takeOutIndex++;
            } else if (dineInIndex < dineIn.length && dineIn[dineInIndex] == order) {
                dineInIndex++;
            } else {
                return false;
            }
        }

        return true;
    }

    // tests

    @Test
    public void bothRegistersHaveSameNumberOfOrdersTest() {
        final int[] takeOut = {1, 4, 5};
        final int[] dineIn = {2, 3, 6};
        final int[] servedOrders = {1, 2, 3, 4, 5, 6};
        final boolean result = isFirstComeFirstServed(takeOut, dineIn, servedOrders);
        assertTrue(result);
    }

    @Test
    public void registersHaveDifferentLengthsTest() {
        final int[] takeOut = {1, 5};
        final int[] dineIn = {2, 3, 6};
        final int[] servedOrders = {1, 2, 6, 3, 5};
        final boolean result = isFirstComeFirstServed(takeOut, dineIn, servedOrders);
        assertFalse(result);
    }

    @Test
    public void oneRegisterIsEmptyTest() {
        final int[] takeOut = {};
        final int[] dineIn = {2, 3, 6};
        final int[] servedOrders = {2, 3, 6};
        final boolean result = isFirstComeFirstServed(takeOut, dineIn, servedOrders);
        assertTrue(result);
    }

    @Test
    public void servedOrdersIsMissingOrdersTest() {
        final int[] takeOut = {1, 5};
        final int[] dineIn = {2, 3, 6};
        final int[] servedOrders = {1, 6, 3, 5};
        final boolean result = isFirstComeFirstServed(takeOut, dineIn, servedOrders);
        assertFalse(result);
    }

    @Test
    public void servedOrdersHasExtraOrders() {
        final int[] takeOut = {1, 5};
        final int[] dineIn = {2, 3, 6};
        final int[] servedOrders = {1, 2, 3, 5, 6, 8};
        final boolean result = isFirstComeFirstServed(takeOut, dineIn, servedOrders);
        assertFalse(result);
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
