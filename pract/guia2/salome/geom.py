# -*- coding: utf-8 -*-

###
### This file is generated automatically by SALOME v8.2.0 with dump python functionality
###

import sys
import salome

salome.salome_init()
theStudy = salome.myStudy

import salome_notebook
notebook = salome_notebook.NoteBook(theStudy)
sys.path.insert( 0, r'/home/zeeburg/Documents/CIMEC/Cursos/FEM/pract/guia2/ej5')

###
### GEOM component
###

import GEOM
from salome.geom import geomBuilder
import math
import SALOMEDS


geompy = geomBuilder.New(theStudy)

O = geompy.MakeVertex(0, 0, 0)
OX = geompy.MakeVectorDXDYDZ(1, 0, 0)
OY = geompy.MakeVectorDXDYDZ(0, 1, 0)
OZ = geompy.MakeVectorDXDYDZ(0, 0, 1)
Vertex_1 = geompy.MakeVertex(0, 0, 0)
Vertex_2 = geompy.MakeVertex(5, 0, 0)
Vertex_3 = geompy.MakeVertex(5, 4, 0)
Vertex_4 = geompy.MakeVertex(2, 4, 0)
Vertex_5 = geompy.MakeVertex(0, 4, 0)
Vertex_6 = geompy.MakeVertex(0, 2, 0)
Vertex_7 = geompy.MakeVertex(2, 2, 0)
Line_1 = geompy.MakeLineTwoPnt(Vertex_1, Vertex_2)
Line_2 = geompy.MakeLineTwoPnt(Vertex_2, Vertex_3)
Line_3 = geompy.MakeLineTwoPnt(Vertex_3, Vertex_4)
Line_4 = geompy.MakeLineTwoPnt(Vertex_4, Vertex_7)
Line_5 = geompy.MakeLineTwoPnt(Vertex_7, Vertex_6)
Line_1_vertex_2 = geompy.GetSubShape(Line_1, [2])
Line_6 = geompy.MakeLineTwoPnt(Vertex_6, Line_1_vertex_2)
Face_1 = geompy.MakeFaceWires([Line_1, Line_2, Line_3, Line_4, Line_5, Line_6], 1)
Vertex_8 = geompy.MakeVertex(0, 2, 0)
Vertex_9 = geompy.MakeVertex(2, 2, 0)
Vertex_10 = geompy.MakeVertex(2, 4, 0)
Line_7 = geompy.MakeLineTwoPnt(Vertex_10, Vertex_5)
Line_8 = geompy.MakeLineTwoPnt(Vertex_5, Vertex_8)
Line_9 = geompy.MakeLineTwoPnt(Vertex_8, Vertex_9)
Line_7_vertex_2 = geompy.GetSubShape(Line_7, [2])
Line_10 = geompy.MakeLineTwoPnt(Vertex_9, Line_7_vertex_2)
Face_2 = geompy.MakeFaceWires([Line_7, Line_8, Line_9, Line_10], 1)
geompy.addToStudy( O, 'O' )
geompy.addToStudy( OX, 'OX' )
geompy.addToStudy( OY, 'OY' )
geompy.addToStudy( OZ, 'OZ' )
geompy.addToStudy( Vertex_1, 'Vertex_1' )
geompy.addToStudy( Vertex_2, 'Vertex_2' )
geompy.addToStudy( Vertex_3, 'Vertex_3' )
geompy.addToStudy( Vertex_4, 'Vertex_4' )
geompy.addToStudy( Vertex_5, 'Vertex_5' )
geompy.addToStudy( Vertex_6, 'Vertex_6' )
geompy.addToStudy( Vertex_7, 'Vertex_7' )
geompy.addToStudy( Line_1, 'Line_1' )
geompy.addToStudy( Line_2, 'Line_2' )
geompy.addToStudy( Line_3, 'Line_3' )
geompy.addToStudy( Line_4, 'Line_4' )
geompy.addToStudy( Line_5, 'Line_5' )
geompy.addToStudyInFather( Line_1, Line_1_vertex_2, 'Line_1:vertex_2' )
geompy.addToStudy( Line_6, 'Line_6' )
geompy.addToStudy( Face_1, 'Face_1' )
geompy.addToStudy( Vertex_8, 'Vertex_8' )
geompy.addToStudy( Vertex_9, 'Vertex_9' )
geompy.addToStudy( Vertex_10, 'Vertex_10' )
geompy.addToStudy( Line_7, 'Line_7' )
geompy.addToStudy( Line_8, 'Line_8' )
geompy.addToStudy( Line_9, 'Line_9' )
geompy.addToStudyInFather( Line_7, Line_7_vertex_2, 'Line_7:vertex_2' )
geompy.addToStudy( Line_10, 'Line_10' )
geompy.addToStudy( Face_2, 'Face_2' )


if salome.sg.hasDesktop():
  salome.sg.updateObjBrowser(True)
