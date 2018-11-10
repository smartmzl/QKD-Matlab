sigma_x = [0, 1; 1, 0];
sigma_y = [0, -1i; 1i, 0];

A = kron(kron(sigma_y, sigma_x), sigma_x) ...
  + kron(kron(sigma_x, sigma_y), sigma_x) ...
  + kron(kron(sigma_x, sigma_x), sigma_y) ...
  - kron(kron(sigma_y, sigma_y), sigma_y);
disp(A);

vector_H = [1, 0];
vector_V = [0, 1];

W = kron(vector_H, kron(vector_H, vector_H)) + ...
    1i * kron(vector_V, kron(vector_V, vector_V));
disp(W);

result = W * A * W';
disp(result);

W_A = W * A;
disp(W_A);