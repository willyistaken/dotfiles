#include<bits/stdc++.h>
using namespace std;

std::vector<int> calculateZ(const std::string& str) {
    int n = str.size();
    std::vector<int> Z(n, 0);
    int L = 0, R = 0;

    for (int i = 1; i < n; ++i) {
        if (i <= R) {
            Z[i] = std::min(R - i + 1, Z[i - L]);
        }
        while (i + Z[i] < n && str[Z[i]] == str[i + Z[i]]) {
            ++Z[i];
        }
        if (i + Z[i] - 1 > R) {
            L = i;
            R = i + Z[i] - 1;
        }
    }
    return Z;
}

bool containsSubstring(const std::string& text, const std::string& pattern) {
    std::string concat = pattern + "$" + text;
    std::vector<int> Z = calculateZ(concat);
    int m = pattern.size();
    int n = text.size();

    for (int i = m + 1; i < Z.size(); ++i) {
        if (Z[i] == m) {
            return true;
        }
    }

    return false;
}



int main(){
	ios_base::sync_with_stdio(0);cin.tie(0);
	string s;
	int currentid=0;
	string pattern = "media.class = \"Audio/Sink\"";
	bool k = 0;
	while(getline(cin,s)){
		if(s[1]=='i'){
			if(k){
				cout<<currentid<<endl;
			}
			k=0;
			int id = 0;	
			for(int i=4;i<s.size();i++){
				if(s[i]==',') break;
				id*=10;
				id+=s[i]-'0';
			}
			currentid=id;
		}
		if(containsSubstring(s,pattern)){
			k=1;
		}
	}
}
