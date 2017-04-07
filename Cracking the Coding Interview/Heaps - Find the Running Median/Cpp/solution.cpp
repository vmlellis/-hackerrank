#include <vector>
#include <iostream>
#include <iomanip>
#include <algorithm>

using namespace std;

double getMedian(vector<int> a ) {
    double median = 0;

    if (a.size()==1) {
        return a[0];
    }

    if (a.size()%2!=0) {
        int mid = a.size()/2;
        median = (double)a[mid];
    }
    else {
        int mid1 = a.size() / 2;
        int mid2 = mid1 - 1;
        median = ((double)a[mid1] + (double)a[mid2]) / 2;
    }

    return (double)median;
}

int main()
{
    int n;
    cin >> n;
    vector<int> a;
    for (int a_i = 0; a_i < n; a_i++) {
        int tmp;
        cin >> tmp;
        if (a.size() == 0) {
            a.push_back(tmp);
        }
        else {
            a.insert(upper_bound(a.begin(), a.end(), tmp), tmp);
        }
        cout << fixed;
        cout << setprecision(1);
        cout << getMedian(a)<<endl;
    }
    return 0;
}
