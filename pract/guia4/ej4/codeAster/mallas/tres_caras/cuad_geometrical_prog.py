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
sys.path.insert( 0, r'/home/zeeburg/Documents/CIMEC/Cursos/FEM/pract/guia4/ej4/codeAster/mallas/tres_caras')

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
Vertex_2 = geompy.MakeVertex(8, 0, 0)
Vertex_3 = geompy.MakeVertex(8, 29, 0)
Vertex_4 = geompy.MakeVertex(0, 29, 0)
Line_1 = geompy.MakeLineTwoPnt(Vertex_1, Vertex_2)
Line_2 = geompy.MakeLineTwoPnt(Vertex_4, Vertex_3)
Line_1_vertex_2 = geompy.GetSubShape(Line_1, [2])
Line_2_vertex_2 = geompy.GetSubShape(Line_2, [2])
Line_3 = geompy.MakeLineTwoPnt(Line_1_vertex_2, Line_2_vertex_2)
Line_1_vertex_3 = geompy.GetSubShape(Line_1, [3])
Line_2_vertex_3 = geompy.GetSubShape(Line_2, [3])
Line_4 = geompy.MakeLineTwoPnt(Line_1_vertex_3, Line_2_vertex_3)
cuad_1 = geompy.MakeFaceWires([Line_1, Line_2, Line_3, Line_4], 1)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
[Edge_9,Edge_10,Edge_11,Edge_12] = geompy.ExtractShapes(cuad_1, geompy.ShapeType["EDGE"], True)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
Vertex_5 = geompy.MakeVertex(0, 37, 0)
Vertex_6 = geompy.MakeVertex(8, 37, 0)
Line_5 = geompy.MakeLineTwoPnt(Vertex_5, Vertex_6)
Face_1_vertex_9 = geompy.GetSubShape(cuad_1, [9])
Face_1_vertex_7 = geompy.GetSubShape(cuad_1, [7])
Line_6 = geompy.MakeLineTwoPnt(Face_1_vertex_9, Face_1_vertex_7)
Line_5_vertex_3 = geompy.GetSubShape(Line_5, [3])
Line_7 = geompy.MakeLineTwoPnt(Face_1_vertex_7, Line_5_vertex_3)
Line_5_vertex_2 = geompy.GetSubShape(Line_5, [2])
Line_8 = geompy.MakeLineTwoPnt(Face_1_vertex_9, Line_5_vertex_2)
cuad_chic = geompy.MakeFaceWires([Line_5, Line_6, Line_7, Line_8], 1)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
[Edge_1,Edge_2,Edge_3,Edge_4] = geompy.ExtractShapes(cuad_chic, geompy.ShapeType["EDGE"], True)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chic, geompy.ShapeType["EDGE"])
Vertex_7 = geompy.MakeVertex(37, 29, 0)
Vertex_8 = geompy.MakeVertex(37, 37, 0)
Line_9 = geompy.MakeLineTwoPnt(Face_1_vertex_7, Vertex_7)
cuad_chic_vertex_5 = geompy.GetSubShape(cuad_chic, [5])
Line_10 = geompy.MakeLineTwoPnt(cuad_chic_vertex_5, Vertex_8)
Line_9_vertex_3 = geompy.GetSubShape(Line_9, [3])
Line_10_vertex_3 = geompy.GetSubShape(Line_10, [3])
Line_11 = geompy.MakeLineTwoPnt(Line_9_vertex_3, Line_10_vertex_3)
Line_12 = geompy.MakeLineTwoPnt(Face_1_vertex_7, cuad_chic_vertex_5)
cuad_2 = geompy.MakeFaceWires([Line_9, Line_10, Line_11, Line_12], 1)
[Edge_5,Edge_6,Edge_7,Edge_8] = geompy.ExtractShapes(cuad_2, geompy.ShapeType["EDGE"], True)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
cuad_chic_x = geompy.CreateGroup(cuad_chic, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_chic_x, [8, 3])
cuad_chic_y = geompy.CreateGroup(cuad_chic, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_chic_y, [10, 6])
cuad_2_y = geompy.CreateGroup(cuad_2, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_2_y, [6, 10])
cuad_2_x = geompy.CreateGroup(cuad_2, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_2_x, [3, 8])
cuad_1_y = geompy.CreateGroup(cuad_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_1_y, [10, 6])
cuad_1_x = geompy.CreateGroup(cuad_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_1_x, [3, 8])
geompy.addToStudy( O, 'O' )
geompy.addToStudy( OX, 'OX' )
geompy.addToStudy( OY, 'OY' )
geompy.addToStudy( OZ, 'OZ' )
geompy.addToStudy( Vertex_1, 'Vertex_1' )
geompy.addToStudy( Vertex_3, 'Vertex_3' )
geompy.addToStudy( Vertex_2, 'Vertex_2' )
geompy.addToStudy( Vertex_4, 'Vertex_4' )
geompy.addToStudy( Line_1, 'Line_1' )
geompy.addToStudy( Line_2, 'Line_2' )
geompy.addToStudyInFather( Line_2, Line_2_vertex_2, 'Line_2:vertex_2' )
geompy.addToStudyInFather( Line_1, Line_1_vertex_2, 'Line_1:vertex_2' )
geompy.addToStudy( Line_3, 'Line_3' )
geompy.addToStudyInFather( Line_1, Line_1_vertex_3, 'Line_1:vertex_3' )
geompy.addToStudyInFather( Line_2, Line_2_vertex_3, 'Line_2:vertex_3' )
geompy.addToStudy( Line_4, 'Line_4' )
geompy.addToStudy( cuad_1, 'cuad_1' )
geompy.addToStudy( Vertex_5, 'Vertex_5' )
geompy.addToStudy( Vertex_6, 'Vertex_6' )
geompy.addToStudy( Line_5, 'Line_5' )
geompy.addToStudyInFather( cuad_1, Face_1_vertex_9, 'Face_1:vertex_9' )
geompy.addToStudyInFather( cuad_1, Face_1_vertex_7, 'Face_1:vertex_7' )
geompy.addToStudy( Line_6, 'Line_6' )
geompy.addToStudyInFather( Line_5, Line_5_vertex_3, 'Line_5:vertex_3' )
geompy.addToStudy( Line_7, 'Line_7' )
geompy.addToStudyInFather( Line_5, Line_5_vertex_2, 'Line_5:vertex_2' )
geompy.addToStudy( Line_8, 'Line_8' )
geompy.addToStudy( cuad_chic, 'cuad_chic' )
geompy.addToStudy( Vertex_7, 'Vertex_7' )
geompy.addToStudy( Vertex_8, 'Vertex_8' )
geompy.addToStudy( Line_9, 'Line_9' )
geompy.addToStudyInFather( cuad_chic, cuad_chic_vertex_5, 'cuad_chic:vertex_5' )
geompy.addToStudy( Line_10, 'Line_10' )
geompy.addToStudyInFather( Line_9, Line_9_vertex_3, 'Line_9:vertex_3' )
geompy.addToStudyInFather( Line_10, Line_10_vertex_3, 'Line_10:vertex_3' )
geompy.addToStudy( Line_11, 'Line_11' )
geompy.addToStudy( Line_12, 'Line_12' )
geompy.addToStudy( cuad_2, 'cuad_2' )
geompy.addToStudyInFather( cuad_chic, Edge_1, 'Edge_1' )
geompy.addToStudyInFather( cuad_chic, Edge_2, 'Edge_2' )
geompy.addToStudyInFather( cuad_chic, Edge_3, 'Edge_3' )
geompy.addToStudyInFather( cuad_chic, Edge_4, 'Edge_4' )
geompy.addToStudyInFather( cuad_chic, cuad_chic_x, 'cuad_chic_x' )
geompy.addToStudyInFather( cuad_chic, cuad_chic_y, 'cuad_chic_y' )
geompy.addToStudyInFather( cuad_2, Edge_5, 'Edge_5' )
geompy.addToStudyInFather( cuad_2, Edge_6, 'Edge_6' )
geompy.addToStudyInFather( cuad_2, Edge_7, 'Edge_7' )
geompy.addToStudyInFather( cuad_2, Edge_8, 'Edge_8' )
geompy.addToStudyInFather( cuad_2, cuad_2_y, 'cuad_2_y' )
geompy.addToStudyInFather( cuad_2, cuad_2_x, 'cuad_2_x' )
geompy.addToStudyInFather( cuad_1, Edge_9, 'Edge_9' )
geompy.addToStudyInFather( cuad_1, Edge_10, 'Edge_10' )
geompy.addToStudyInFather( cuad_1, Edge_11, 'Edge_11' )
geompy.addToStudyInFather( cuad_1, Edge_12, 'Edge_12' )
geompy.addToStudyInFather( cuad_1, cuad_1_y, 'cuad_1_y' )
geompy.addToStudyInFather( cuad_1, cuad_1_x, 'cuad_1_x' )

###
### SMESH component
###

import  SMESH, SALOMEDS
from salome.smesh import smeshBuilder

from salome.StdMeshers import StdMeshersBuilder

smesh = smeshBuilder.New(theStudy)
Quadrangle_Parameters_1 = smesh.CreateHypothesis('QuadrangleParams')
Quadrangle_Parameters_1.SetQuadType( StdMeshersBuilder.QUAD_QUADRANGLE_PREF )
Quadrangle_Parameters_1.SetTriaVertex( -1 )
Quadrangle_Parameters_1.SetEnforcedNodes( [], [] )
Quadrangle_Parameters_2 = smesh.CreateHypothesis('QuadrangleParams')
Quadrangle_Parameters_2.SetQuadType( StdMeshersBuilder.QUAD_QUADRANGLE_PREF )
Quadrangle_Parameters_2.SetTriaVertex( -1 )
Quadrangle_Parameters_2.SetEnforcedNodes( [], [] )
Mesh_1 = smesh.Mesh(cuad_2)
Quadrangle_2D = Mesh_1.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_3 = Quadrangle_2D.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
cuad_2_y_1 = Mesh_1.GroupOnGeom(cuad_2_y,'cuad_2_y',SMESH.EDGE)
cuad_2_x_1 = Mesh_1.GroupOnGeom(cuad_2_x,'cuad_2_x',SMESH.EDGE)
Regular_1D = Mesh_1.Segment(geom=cuad_2_y)
cuad_2d_Y = Regular_1D.NumberOfSegments(15,5,[])
Regular_1D_1 = Mesh_1.Segment(geom=cuad_2_x)
cuad_2_x_2 = Regular_1D_1.NumberOfSegments(15,0.5,[])
[ cuad_2_y_1, cuad_2_x_1 ] = Mesh_1.GetGroups()
cuad_2_x_2.SetNumberOfSegments( 15 )
cuad_2_x_2.SetScaleFactor( 3 )
cuad_2_x_2.SetReversedEdges( [] )
[ cuad_2_y_1, cuad_2_x_1 ] = Mesh_1.GetGroups()
cuad_2d_Y.SetNumberOfSegments( 10 )
cuad_2d_Y.SetScaleFactor( 5 )
cuad_2d_Y.SetReversedEdges( [] )
isDone = Mesh_1.Compute()
[ cuad_2_y_1, cuad_2_x_1 ] = Mesh_1.GetGroups()
Mesh_2 = smesh.Mesh(cuad_chic)
Quadrangle_2D_1 = Mesh_2.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_4 = Quadrangle_2D_1.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
cuad_chic_x_1 = Mesh_2.GroupOnGeom(cuad_chic_x,'cuad_chic_x',SMESH.EDGE)
cuad_chic_y_1 = Mesh_2.GroupOnGeom(cuad_chic_y,'cuad_chic_y',SMESH.EDGE)
Regular_1D_2 = Mesh_2.Segment(geom=cuad_chic_x)
cuad_chic_x_2 = Regular_1D_2.NumberOfSegments(5,0.2,[])
Regular_1D_3 = Mesh_2.Segment(geom=cuad_chic_y)
cuad_chic_y_2 = Regular_1D_3.NumberOfSegments(5,1,[])
[ cuad_chic_x_1, cuad_chic_y_1 ] = Mesh_2.GetGroups()
cuad_chic_y_2.SetNumberOfSegments( 10 )
cuad_chic_y_2.SetScaleFactor( 5 )
cuad_chic_y_2.SetReversedEdges( [] )
isDone = Mesh_2.Compute()
[ cuad_chic_x_1, cuad_chic_y_1 ] = Mesh_2.GetGroups()
Mesh_3 = smesh.Mesh(cuad_1)
Quadrangle_2D_2 = Mesh_3.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_5 = Quadrangle_2D_2.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
Quadrangle_Parameters_6 = smesh.CreateHypothesis('QuadrangleParams')
Quadrangle_Parameters_6.SetQuadType( StdMeshersBuilder.QUAD_QUADRANGLE_PREF )
Quadrangle_Parameters_6.SetTriaVertex( -1 )
Quadrangle_Parameters_6.SetEnforcedNodes( [], [] )
Regular_1D_4 = Mesh_3.Segment(geom=cuad_1_x)
cuad_1_x_1 = Regular_1D_4.NumberOfSegments(5,0.2,[])
Regular_1D_5 = Mesh_3.Segment(geom=cuad_1_y)
cuad_1_y_1 = Regular_1D_5.NumberOfSegments(15,0.5,[])
isDone = Mesh_3.Compute()
Sub_mesh_1 = Regular_1D.GetSubMesh()
Sub_mesh_2 = Regular_1D_1.GetSubMesh()
Sub_mesh_3 = Regular_1D_2.GetSubMesh()
Sub_mesh_4 = Regular_1D_3.GetSubMesh()
Sub_mesh_5 = Regular_1D_4.GetSubMesh()
Sub_mesh_6 = Regular_1D_5.GetSubMesh()


## Set names of Mesh objects
smesh.SetName(cuad_2_y_1, 'cuad_2_y')
smesh.SetName(Quadrangle_2D.GetAlgorithm(), 'Quadrangle_2D')
smesh.SetName(Regular_1D.GetAlgorithm(), 'Regular_1D')
smesh.SetName(Quadrangle_Parameters_2, 'Quadrangle Parameters_2')
smesh.SetName(Quadrangle_Parameters_3, 'Quadrangle Parameters_3')
smesh.SetName(Quadrangle_Parameters_1, 'Quadrangle Parameters_1')
smesh.SetName(Quadrangle_Parameters_4, 'Quadrangle Parameters_4')
smesh.SetName(cuad_chic_x_2, 'cuad_chic_x')
smesh.SetName(cuad_2d_Y, 'cuad_2d_Y')
smesh.SetName(cuad_2_x_2, 'cuad_2_x')
smesh.SetName(cuad_chic_y_2, 'cuad_chic_y')
smesh.SetName(Quadrangle_Parameters_5, 'Quadrangle Parameters_5')
smesh.SetName(Sub_mesh_1, 'Sub-mesh_1')
smesh.SetName(Sub_mesh_2, 'Sub-mesh_2')
smesh.SetName(Mesh_2.GetMesh(), 'Mesh_2')
smesh.SetName(Mesh_1.GetMesh(), 'Mesh_1')
smesh.SetName(Mesh_3.GetMesh(), 'Mesh_3')
smesh.SetName(cuad_chic_y_1, 'cuad_chic_y')
smesh.SetName(cuad_chic_x_1, 'cuad_chic_x')
smesh.SetName(Sub_mesh_6, 'Sub-mesh_6')
smesh.SetName(Sub_mesh_5, 'Sub-mesh_5')
smesh.SetName(cuad_1_x_1, 'cuad_1_x')
smesh.SetName(Quadrangle_Parameters_6, 'Quadrangle Parameters_6')
smesh.SetName(Sub_mesh_3, 'Sub-mesh_3')
smesh.SetName(cuad_1_y_1, 'cuad_1_y')
smesh.SetName(Sub_mesh_4, 'Sub-mesh_4')
smesh.SetName(cuad_2_x_1, 'cuad_2_x')


if salome.sg.hasDesktop():
  salome.sg.updateObjBrowser(True)
