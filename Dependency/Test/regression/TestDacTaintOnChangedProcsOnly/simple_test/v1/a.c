int a(int x) {
  return x;
}

int b(int x) {
  x = x + 21;
  return a(x);
}

int main(int argc, char** argv) {
  return b(121);
}
