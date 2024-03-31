/*class Solution {
public:
    typedef long long ll;
    long long countSubarrays(vector<int>& nums, int minK, int maxK) {
        int n = nums.size();
        ll result = 0;
        int minKIndex = -1;  // Index of most recent minK
        int maxKIndex = -1;  // Index of last maxK
        int culpritIndex = -1; // Index of first element violating subarray conditions

        for (int i = 0; i < n; i++) {
            if (nums[i] < minK || nums[i] > maxK) {
                culpritIndex = i;  // Update culprit index if element violates conditions
            }

            if (nums[i] == minK) {
                minKIndex = i;     // Update minKIndex
            }

            if (nums[i] == maxK) {
                maxKIndex = i;     // Update maxKIndex
            }

            ll smaller = min(minKIndex, maxKIndex);  // Get smaller index
            ll temp = smaller - culpritIndex;        // Calculate potential subarrays

            result += temp <= 0 ? 0 : temp;          // Add valid subarrays to result
        }
        return result;
    }
};*/

/* Write your T-SQL query statement below */
SELECT query_name, 
ROUND(avg(1.00*rating/position), 2)AS quality , 
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2)AS poor_query_percentage
FROM Queries
where query_name IS NOT NULL
GROUP BY query_name;
