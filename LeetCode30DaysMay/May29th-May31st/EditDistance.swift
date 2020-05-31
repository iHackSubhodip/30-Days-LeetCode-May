/*
 Question - Edit Distance
 Link - > https://leetcode.com/explore/featured/card/may-leetcoding-challenge/538/week-5-may-29th-may-31st/3346/
 */

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1.count > 0 else { return word2.count }
        guard word2.count > 0 else { return word1.count }
        var word1 = Array(word1), word2 = Array(word2)
        var dpGrid = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        for x in 0...word1.count { dpGrid[x][0] = x }
        for y in 0...word2.count { dpGrid[0][y] = y }
        
        for x in 1...word1.count{
            for y in 1...word2.count{
                if word1[x-1] == word2[y-1]{
                    dpGrid[x][y] = dpGrid[x-1][y-1]
                }else{
                    dpGrid[x][y] = 1 + min(dpGrid[x-1][y], min(dpGrid[x-1][y-1], dpGrid[x][y-1]))
                }
            }
        }
        
        return dpGrid[word1.count][word2.count]
    }
}

