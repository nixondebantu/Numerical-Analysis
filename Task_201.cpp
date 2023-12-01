#include <iostream>
using namespace std;

float a[3];

void gauss_elimination(float t[3],float v[3]){
    
    // Augmented Matrix
    float mat[3][4] = {{t[0]*t[0], t[0], 1, v[0]},
                        {t[1]*t[1], t[1], 1, v[1]},
                        {t[2]*t[2], t[2], 1, v[2]}};
    
    // Generating upper trinagular matrix
    float r;
    int n=3;
    for(int i = 0; i<n; i++){
        for(int j = i+1; j<n;j++){
            r = mat[j][i] / mat[i][i];
            for(int k = 0; k<=n; k++){
                mat[j][k] -= r*mat[i][k];
            }
        }
    }
    
    // Back Substitution
    a[n-1] = mat[n-1][n]/mat[n-1][n-1];
    for(int i = n-2; i>=0; i--){
        a[i] = mat[i][n];
        for(int j = i+1; j<n; j++){
            a[i] = a[i] - mat[i][j]*a[j];
        }
        a[i] = a[i]/mat[i][i];
    }

}

void ansQ1(){
    cout<<"Values of a1, a2, a3:\n";
    for(int i = 0; i<3; i++){
        printf("a%d = %f\n" ,i+1 ,a[i]);
    }
}

void getVelocity(int t){
    printf("Velocity at t = %d is %f\n" ,t ,a[0]*t*t + a[1]*t + a[2]);
}

int main(){
    float t[3] = {5, 8, 12};
    float v[3] = {106.8, 177.2, 279.2};
    
    gauss_elimination(t,v);

    ansQ1();
    getVelocity(6);
}