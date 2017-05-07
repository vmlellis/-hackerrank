import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    static ArrayList<Long> max_scores = new ArrayList<Long>();

    static void populateMaxScores(long[] a, long score, long runningSum) {
        for (int i = 0; i < a.length; i++) {
            long[] copy = new long[a.length - 1];
            System.arraycopy(a, 0, copy, 0, i);
            System.arraycopy(a, i + 1, copy, i, copy.length - i);
            populateMaxScores(copy, score + runningSum % a[i], runningSum + a[i]);
        }
        if (a.length == 0) {
            max_scores.add(score);
        }
    }

    static long getMaxScore(long[] a){
        // Complete this function
        populateMaxScores(a, 0, 0);
        return Collections.max(max_scores);
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        long[] a = new long[n];
        for(int a_i=0; a_i < n; a_i++){
            a[a_i] = in.nextLong();
        }
        long maxScore = getMaxScore(a);
        System.out.println(maxScore);
    }
}
