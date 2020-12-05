class Punto
{
    public:
        Punto();
        Punto(int x0, int y0);
        int getX();
        void setX(int x0);
        int getY();
        void setY(int y0);
    private:
        int x;
        int y;
};

Punto::Punto() {
    x=0;
    y=0;
}

Punto::Punto(int x0, int y0) {
    x = x0;
    y = y0;;
}
int Punto::getX() {
    return x;
}

int Punto::getY() {
    return y;
}

void Punto::setX(int x0) {
   x = x0;
}

void Punto::setY(int y0) {
   y = y0;
}
