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
sys.path.insert( 0, r'/home/zeeburg/Documents/CIMEC/Cursos/FEM/pract/guia4/ej4/codeAster/mallas/testing_mallas')

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
Vertex_3 = geompy.MakeVertex(5, 2, 0)
Vertex_4 = geompy.MakeVertex(3, 2, 0)
Vertex_5 = geompy.MakeVertex(0, 2, 0)
Line_1 = geompy.MakeLineTwoPnt(Vertex_1, Vertex_2)
Projection_1 = geompy.MakeProjection(Vertex_4, Line_1)
Line_2 = geompy.MakeLineTwoPnt(Vertex_1, Projection_1)
Line_3 = geompy.MakeLineTwoPnt(Vertex_5, Vertex_4)
Line_3_vertex_3 = geompy.GetSubShape(Line_3, [3])
Line_4 = geompy.MakeLineTwoPnt(Vertex_3, Line_3_vertex_3)
Line_2_vertex_3 = geompy.GetSubShape(Line_2, [3])
Line_5 = geompy.MakeLineTwoPnt(Vertex_2, Line_2_vertex_3)
Line_4_vertex_2 = geompy.GetSubShape(Line_4, [2])
Line_5_vertex_2 = geompy.GetSubShape(Line_5, [2])
Line_6 = geompy.MakeLineTwoPnt(Line_4_vertex_2, Line_5_vertex_2)
Line_3_vertex_2 = geompy.GetSubShape(Line_3, [2])
Line_2_vertex_2 = geompy.GetSubShape(Line_2, [2])
Line_7 = geompy.MakeLineTwoPnt(Line_3_vertex_2, Line_2_vertex_2)
Face_1 = geompy.MakeFaceWires([Line_2, Line_3, Line_4, Line_5, Line_6, Line_7], 1)
[Edge_1,Edge_2,Edge_3,Edge_4,Edge_5,Edge_6] = geompy.ExtractShapes(Face_1, geompy.ShapeType["EDGE"], True)
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(Face_1, geompy.ShapeType["EDGE"])
carga = geompy.CreateGroup(Face_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(carga, [8, 14])
lado_larg = geompy.CreateGroup(Face_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(lado_larg, [3, 12])
lado_cort = geompy.CreateGroup(Face_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(lado_cort, [6, 10])
geompy.addToStudy( O, 'O' )
geompy.addToStudy( OX, 'OX' )
geompy.addToStudy( OY, 'OY' )
geompy.addToStudy( OZ, 'OZ' )
geompy.addToStudy( Vertex_1, 'Vertex_1' )
geompy.addToStudy( Vertex_2, 'Vertex_2' )
geompy.addToStudy( Vertex_3, 'Vertex_3' )
geompy.addToStudy( Vertex_4, 'Vertex_4' )
geompy.addToStudy( Vertex_5, 'Vertex_5' )
geompy.addToStudy( Line_1, 'Line_1' )
geompy.addToStudy( Projection_1, 'Projection_1' )
geompy.addToStudy( Line_2, 'Line_2' )
geompy.addToStudy( Line_3, 'Line_3' )
geompy.addToStudyInFather( Line_3, Line_3_vertex_3, 'Line_3:vertex_3' )
geompy.addToStudy( Line_4, 'Line_4' )
geompy.addToStudyInFather( Line_2, Line_2_vertex_3, 'Line_2:vertex_3' )
geompy.addToStudy( Line_5, 'Line_5' )
geompy.addToStudyInFather( Line_4, Line_4_vertex_2, 'Line_4:vertex_2' )
geompy.addToStudyInFather( Line_5, Line_5_vertex_2, 'Line_5:vertex_2' )
geompy.addToStudy( Line_6, 'Line_6' )
geompy.addToStudyInFather( Line_3, Line_3_vertex_2, 'Line_3:vertex_2' )
geompy.addToStudyInFather( Line_2, Line_2_vertex_2, 'Line_2:vertex_2' )
geompy.addToStudy( Line_7, 'Line_7' )
geompy.addToStudy( Face_1, 'Face_1' )
geompy.addToStudyInFather( Face_1, Edge_1, 'Edge_1' )
geompy.addToStudyInFather( Face_1, Edge_2, 'Edge_2' )
geompy.addToStudyInFather( Face_1, Edge_3, 'Edge_3' )
geompy.addToStudyInFather( Face_1, Edge_4, 'Edge_4' )
geompy.addToStudyInFather( Face_1, Edge_5, 'Edge_5' )
geompy.addToStudyInFather( Face_1, Edge_6, 'Edge_6' )
geompy.addToStudyInFather( Face_1, carga, 'carga' )
geompy.addToStudyInFather( Face_1, lado_larg, 'lado_larg' )
geompy.addToStudyInFather( Face_1, lado_cort, 'lado_cort' )

###
### SMESH component
###

import  SMESH, SALOMEDS
from salome.smesh import smeshBuilder

from salome.StdMeshers import StdMeshersBuilder

smesh = smeshBuilder.New(theStudy)
Mesh_1 = smesh.Mesh(Face_1)
Quadrangle_2D = Mesh_1.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_1 = Quadrangle_2D.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
Regular_1D = Mesh_1.Segment(geom=carga)
carga_1 = Regular_1D.NumberOfSegments(10,1,[])
Regular_1D_1 = Mesh_1.Segment(geom=lado_larg)
lado_larg_1 = Regular_1D_1.NumberOfSegments(15,1,[])
Regular_1D_2 = Mesh_1.Segment(geom=lado_cort)
lado_cort_1 = Regular_1D_2.NumberOfSegments(15,1,[])
carga_2 = Mesh_1.GroupOnGeom(carga,'carga',SMESH.EDGE)
lado_larg_2 = Mesh_1.GroupOnGeom(lado_larg,'lado_larg',SMESH.EDGE)
lado_cort_2 = Mesh_1.GroupOnGeom(lado_cort,'lado_cort',SMESH.EDGE)
[ carga_2, lado_larg_2, lado_cort_2 ] = Mesh_1.GetGroups()
Mesh_1.SetAutoColor( 1 )
[ carga_2, lado_larg_2, lado_cort_2 ] = Mesh_1.GetGroups()
carga_2.SetColor( SALOMEDS.Color( 1, 1, 0 ))
lado_larg_2.SetColor( SALOMEDS.Color( 0, 1, 0 ))
lado_cort_2.SetColor( SALOMEDS.Color( 0, 1, 1 ))
lado_cort_1.SetNumberOfSegments( 15 )
lado_cort_1.SetScaleFactor( 0.2 )
lado_cort_1.SetReversedEdges( [] )
[ carga_2, lado_larg_2, lado_cort_2 ] = Mesh_1.GetGroups()
lado_larg_1.SetNumberOfSegments( 15 )
lado_larg_1.SetScaleFactor( 0.1 )
lado_larg_1.SetReversedEdges( [] )
isDone = Mesh_1.Compute()
[ carga_2, lado_larg_2, lado_cort_2 ] = Mesh_1.GetGroups()
Sub_mesh_1 = Regular_1D.GetSubMesh()
Sub_mesh_2 = Regular_1D_1.GetSubMesh()
Sub_mesh_3 = Regular_1D_2.GetSubMesh()


## Set names of Mesh objects
smesh.SetName(Sub_mesh_2, 'Sub-mesh_2')
smesh.SetName(Sub_mesh_3, 'Sub-mesh_3')
smesh.SetName(Sub_mesh_1, 'Sub-mesh_1')
smesh.SetName(Quadrangle_2D.GetAlgorithm(), 'Quadrangle_2D')
smesh.SetName(Regular_1D.GetAlgorithm(), 'Regular_1D')
smesh.SetName(Mesh_1.GetMesh(), 'Mesh_1')
smesh.SetName(carga_2, 'carga')
smesh.SetName(lado_larg_2, 'lado_larg')
smesh.SetName(lado_cort_2, 'lado_cort')
smesh.SetName(lado_larg_1, 'lado_larg')
smesh.SetName(carga_1, 'carga')
smesh.SetName(Quadrangle_Parameters_1, 'Quadrangle Parameters_1')
smesh.SetName(lado_cort_1, 'lado_cort')


if salome.sg.hasDesktop():
  salome.sg.updateObjBrowser(True)
