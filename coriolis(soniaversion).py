# !/usr/bin/env python
# -*- coding:utf-8 -*-

# Tarea 5
# Dinámica de fluidos geofísicos

"""
EXPLICACIÓN:
La definición del parámetro de Coriolis es

$$f(\phi) = 2 \Omega \sin{\phi}$$

Para la expansión en serie de Taylor tenemos

# $$f(\phi) = \sum_{n=0}^{\infty} \frac{f^{(n)}(\phi_{0})}{n!} (\phi - \phi_{0})^{n} $$

entonces

$$f(\phi) = 2 \Omega \sin \phi_{0} + 2 \Omega \cos \phi_{0} (\phi - \phi_{0}) + 2 \frac{\Omega}{2!}(-\sin \phi_{0}) (\phi - \phi_{0})^{2} + ... $$

Como la diferencia $(\phi - \phi_0)$ se aproxima como $(y/R)$, donde $y$ es el desplazamiento a lo largo del eje y, y $R$ es el radio de la Tierra (con $\Omega = \frac{2\pi}{T} = 7.27 \times 10^{-5} \frac{rad}{s}$ y $R= 6.371 \times 10^{6} m$) tenemos

$$f(\phi) = f_{0} + \beta y + \gamma y^{2} =  2 \Omega \sin \phi_{0} + 2 \Omega \cos\phi_{0} \frac{y}{R} - \Omega \sin \phi_{0} \left( \frac{y}{R} \right)^{2}$$ 


GRÁFICA:
"""


import numpy as np
import matplotlib.pyplot as plt


# En esta clase se definen las funciones que deben analizarse. En el caso de beta y gamma, la primer línea muestra la suma de todos los términos anteriores (f0 y f1 en el caso de beta y f0 f1 y f2 en el caso de gamma) mientras que la segunda sólo incluye a f1 o a f2

class coriolis(object):
    def __init__(self, x):
        self.x = x
    def f(self):
        return 2 * Omega * np.sin(self.x)
    def beta(self):
        #return 2 * Omega * np.sin(self.x) + 2 * Omega * np.cos(self.x) * (y/R)
        return 2 * Omega * np.cos(self.x) * (y/R)
    def gamma(self):
        #return 2 * Omega * np.sin(self.x) + 2 * Omega * np.cos(self.x) * (y/R) - Omega * np.sin(self.x)*(y/R)**2 
        return - Omega * np.sin(self.x)*(y/R)**2 # f2 solita

# Definiendo constantes. Recuerden que y debe ser pequeña comparada con R. Discutan.

Omega = 7.27 * 10**(-5)
R= 6.371 * 10**(6)
y = 10 
latitud = np.linspace(0,np.pi/2,180)
n = len(latitud)


# Calculitos

cor = coriolis( x = latitud )
F = cor.f()
BETA = cor.beta()
GAMMA = cor.gamma()

# Gráfica. En nnnnn deben poner lo que quieran graficar (F, BETA o GAMMA)

plt.plot(latitud, nnnnn)
plt.show()

