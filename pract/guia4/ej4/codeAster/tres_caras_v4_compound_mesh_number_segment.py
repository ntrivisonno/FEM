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
sys.path.insert( 0, r'/home/zeeburg/Documents/CIMEC/Cursos/FEM/pract/guia4/ej4/codeAster')

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
geomObj_1 = geompy.MakeVertex(8, 29, 0)
Vertex_4 = geompy.MakeVertex(37, 29, 0)
Vertex_5 = geompy.MakeVertex(37, 37, 0)
Vertex_6 = geompy.MakeVertex(0, 37, 0)
geomObj_2 = geompy.MakeLineTwoPnt(Vertex_1, Vertex_2)
geomObj_3 = geompy.MakeLineTwoPnt(Vertex_2, geomObj_1)
geomObj_4 = geompy.MakeLineTwoPnt(geomObj_1, Vertex_4)
geomObj_5 = geompy.MakeLineTwoPnt(Vertex_4, Vertex_5)
geomObj_6 = geompy.MakeLineTwoPnt(Vertex_5, Vertex_6)
geomObj_7 = geompy.GetSubShape(geomObj_2, [2])
geomObj_8 = geompy.MakeLineTwoPnt(Vertex_6, geomObj_7)
geomObj_9 = geompy.MakeFaceWires([geomObj_2, geomObj_3, geomObj_4, geomObj_5, geomObj_6, geomObj_8], 1)
Vertex_7 = geompy.MakeVertex(8, 37, 0)
Vertex_3 = geompy.MakeVertex(8, 29, 0)
Vertex_8 = geompy.MakeVertex(0, 29, 0)
Line_1 = geompy.MakeLineTwoPnt(Vertex_1, Vertex_2)
Line_2 = geompy.MakeLineTwoPnt(Vertex_2, Vertex_3)
Line_3 = geompy.MakeLineTwoPnt(Vertex_3, Vertex_8)
Line_1_vertex_2 = geompy.GetSubShape(Line_1, [2])
Line_4 = geompy.MakeLineTwoPnt(Vertex_8, Line_1_vertex_2)
Vertex_9 = geompy.MakeVertex(8, 29, 0)
Line_5 = geompy.MakeLineTwoPnt(Vertex_9, Vertex_4)
Line_6 = geompy.MakeLineTwoPnt(Vertex_4, Vertex_5)
Line_7 = geompy.MakeLineTwoPnt(Vertex_5, Vertex_7)
Line_5_vertex_2 = geompy.GetSubShape(Line_5, [2])
Line_8 = geompy.MakeLineTwoPnt(Vertex_7, Line_5_vertex_2)
Vertex_10 = geompy.MakeVertex(0, 29, 0)
Vertex_11 = geompy.MakeVertex(8, 29, 0)
Vertex_12 = geompy.MakeVertex(8, 37, 0)
Line_9 = geompy.MakeLineTwoPnt(Vertex_12, Vertex_6)
Line_10 = geompy.MakeLineTwoPnt(Vertex_6, Vertex_10)
Line_11 = geompy.MakeLineTwoPnt(Vertex_10, Vertex_11)
Line_9_vertex_2 = geompy.GetSubShape(Line_9, [2])
Line_12 = geompy.MakeLineTwoPnt(Vertex_11, Line_9_vertex_2)
cuad_chico = geompy.MakeFaceWires([Line_9, Line_10, Line_11, Line_12], 1)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_chico, geompy.ShapeType["EDGE"])
cuad_2 = geompy.MakeFaceWires([Line_5, Line_6, Line_7, Line_8], 1)
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["VERTEX"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_2, geompy.ShapeType["EDGE"])
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
cuad_1 = geompy.MakeFaceWires([Line_1, Line_2, Line_3, Line_4], 1)
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
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
listSubShapeIDs = geompy.SubShapeAllIDs(cuad_1, geompy.ShapeType["EDGE"])
cuad_chic_X = geompy.CreateGroup(cuad_chico, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_chic_X, [3, 8])
cuad_chic_Y = geompy.CreateGroup(cuad_chico, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_chic_Y, [6, 10])
cuad_2_X = geompy.CreateGroup(cuad_2, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_2_X, [8, 3])
cuad_2_Y = geompy.CreateGroup(cuad_2, geompy.ShapeType["EDGE"])
geompy.UnionIDs(cuad_2_Y, [10, 6])
Fixa = geompy.CreateGroup(cuad_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(Fixa, [3])
Cuad_1_X = geompy.CreateGroup(cuad_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(Cuad_1_X, [8])
Cuad_1_Y = geompy.CreateGroup(cuad_1, geompy.ShapeType["EDGE"])
geompy.UnionIDs(Cuad_1_Y, [10, 6])
geompy.addToStudy( O, 'O' )
geompy.addToStudy( OX, 'OX' )
geompy.addToStudy( OY, 'OY' )
geompy.addToStudy( OZ, 'OZ' )
geompy.addToStudy( Vertex_1, 'Vertex_1' )
geompy.addToStudy( Vertex_2, 'Vertex_2' )
geompy.addToStudy( Vertex_4, 'Vertex_4' )
geompy.addToStudy( Vertex_5, 'Vertex_5' )
geompy.addToStudy( Vertex_6, 'Vertex_6' )
geompy.addToStudy( Vertex_7, 'Vertex_7' )
geompy.addToStudy( Vertex_3, 'Vertex_3' )
geompy.addToStudy( Vertex_8, 'Vertex_8' )
geompy.addToStudy( Line_1, 'Line_1' )
geompy.addToStudy( Line_2, 'Line_2' )
geompy.addToStudy( Line_3, 'Line_3' )
geompy.addToStudyInFather( Line_1, Line_1_vertex_2, 'Line_1:vertex_2' )
geompy.addToStudy( Line_4, 'Line_4' )
geompy.addToStudy( Vertex_9, 'Vertex_9' )
geompy.addToStudy( Line_5, 'Line_5' )
geompy.addToStudy( Line_6, 'Line_6' )
geompy.addToStudy( Line_7, 'Line_7' )
geompy.addToStudyInFather( Line_5, Line_5_vertex_2, 'Line_5:vertex_2' )
geompy.addToStudy( Line_8, 'Line_8' )
geompy.addToStudy( Vertex_10, 'Vertex_10' )
geompy.addToStudy( Vertex_11, 'Vertex_11' )
geompy.addToStudy( Vertex_12, 'Vertex_12' )
geompy.addToStudy( Line_9, 'Line_9' )
geompy.addToStudy( Line_10, 'Line_10' )
geompy.addToStudy( Line_11, 'Line_11' )
geompy.addToStudyInFather( Line_9, Line_9_vertex_2, 'Line_9:vertex_2' )
geompy.addToStudy( Line_12, 'Line_12' )
geompy.addToStudy( cuad_chico, 'cuad_chico' )
geompy.addToStudy( cuad_2, 'cuad_2' )
geompy.addToStudy( cuad_1, 'cuad_1' )
geompy.addToStudyInFather( cuad_chico, cuad_chic_X, 'cuad_chic_X' )
geompy.addToStudyInFather( cuad_chico, cuad_chic_Y, 'cuad_chic_Y' )
geompy.addToStudyInFather( cuad_2, cuad_2_X, 'cuad_2_X' )
geompy.addToStudyInFather( cuad_2, cuad_2_Y, 'cuad_2_Y' )
geompy.addToStudyInFather( cuad_1, Fixa, 'Fixa' )
geompy.addToStudyInFather( cuad_1, Cuad_1_X, 'Cuad_1_X' )
geompy.addToStudyInFather( cuad_1, Cuad_1_Y, 'Cuad_1_Y' )

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
Number_of_Segments_1 = smesh.CreateHypothesis('NumberOfSegments')
Number_of_Segments_1.SetNumberOfSegments( 15 )
Quadrangle_Parameters_2 = smesh.CreateHypothesis('QuadrangleParams')
Quadrangle_Parameters_2.SetQuadType( StdMeshersBuilder.QUAD_QUADRANGLE_PREF )
Quadrangle_Parameters_2.SetTriaVertex( -1 )
Quadrangle_Parameters_2.SetEnforcedNodes( [], [] )
Quadrangle_Parameters_3 = smesh.CreateHypothesis('QuadrangleParams')
Quadrangle_Parameters_3.SetQuadType( StdMeshersBuilder.QUAD_QUADRANGLE_PREF )
Quadrangle_Parameters_3.SetTriaVertex( -1 )
Quadrangle_Parameters_3.SetEnforcedNodes( [], [] )
Number_of_Segments_2 = smesh.CreateHypothesis('NumberOfSegments')
Number_of_Segments_2.SetNumberOfSegments( 15 )
Mesh_1 = smesh.Mesh(cuad_chico)
Quadrangle_2D = Mesh_1.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_4 = Quadrangle_2D.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
Regular_1D = Mesh_1.Segment(geom=cuad_chic_X)
fixa = Regular_1D.NumberOfSegments(15)
Regular_1D_1 = Mesh_1.Segment(geom=cuad_chic_Y)
carga = Regular_1D_1.NumberOfSegments(15)
isDone = Mesh_1.Compute()
Mesh_2 = smesh.Mesh(cuad_2)
Quadrangle_2D_1 = Mesh_2.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_5 = Quadrangle_2D_1.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
Regular_1D_2 = Mesh_2.Segment(geom=cuad_2_X)
cuad_2_X_1 = Regular_1D_2.NumberOfSegments(30)
Regular_1D_3 = Mesh_2.Segment(geom=cuad_2_Y)
status = Mesh_2.AddHypothesis(carga,cuad_2_Y)
isDone = Mesh_2.Compute()
Mesh_3 = smesh.Mesh(cuad_1)
Quadrangle_2D_2 = Mesh_3.Quadrangle(algo=smeshBuilder.QUADRANGLE)
Quadrangle_Parameters_6 = Quadrangle_2D_2.QuadrangleParameters(StdMeshersBuilder.QUAD_QUADRANGLE_PREF,-1,[],[])
Regular_1D_4 = Mesh_3.Segment(geom=Fixa)
status = Mesh_3.AddHypothesis(fixa,Fixa)
Regular_1D_5 = Mesh_3.Segment(geom=Cuad_1_X)
status = Mesh_3.AddHypothesis(fixa,Cuad_1_X)
Regular_1D_6 = Mesh_3.Segment(geom=Cuad_1_Y)
cuad_1_Y = Regular_1D_6.NumberOfSegments(30)
isDone = Mesh_3.Compute()
cuad_chic_X_1 = Mesh_1.GroupOnGeom(cuad_chic_X,'cuad_chic_X',SMESH.EDGE)
cuad_chic_Y_1 = Mesh_1.GroupOnGeom(cuad_chic_Y,'cuad_chic_Y',SMESH.EDGE)
cuad_2_X_2 = Mesh_2.GroupOnGeom(cuad_2_X,'cuad_2_X',SMESH.EDGE)
cuad_2_Y_1 = Mesh_2.GroupOnGeom(cuad_2_Y,'cuad_2_Y',SMESH.EDGE)
Fixa_1 = Mesh_3.GroupOnGeom(Fixa,'Fixa',SMESH.EDGE)
Cuad_1_X_1 = Mesh_3.GroupOnGeom(Cuad_1_X,'Cuad_1_X',SMESH.EDGE)
Cuad_1_Y_1 = Mesh_3.GroupOnGeom(Cuad_1_Y,'Cuad_1_Y',SMESH.EDGE)
Compound_Mesh_1 = smesh.Concatenate([Mesh_1.GetMesh(), Mesh_2.GetMesh(), Mesh_3.GetMesh()], 1, 1, 1e-05)
[ cuad_chic_X_2, cuad_chic_Y_2, cuad_2_X_3, cuad_2_Y_2, Fixa_2, Cuad_1_X_2, Cuad_1_Y_2 ] = Compound_Mesh_1.GetGroups()
cuad_2_X_1.SetNumberOfSegments( 40 )
isDone = Mesh_2.Compute()
[ cuad_2_X_2, cuad_2_Y_1 ] = Mesh_2.GetGroups()
Sub_mesh_1 = Mesh_1.GetSubMesh( cuad_chic_X, 'Sub-mesh_1' )
Sub_mesh_2 = Mesh_1.GetSubMesh( cuad_chic_Y, 'Sub-mesh_2' )
Sub_mesh_3 = Mesh_2.GetSubMesh( cuad_2_X, 'Sub-mesh_3' )
Sub_mesh_4 = Mesh_2.GetSubMesh( cuad_2_Y, 'Sub-mesh_4' )
Sub_mesh_5 = Mesh_3.GetSubMesh( Fixa, 'Sub-mesh_5' )
Sub_mesh_6 = Mesh_3.GetSubMesh( Cuad_1_X, 'Sub-mesh_6' )
Sub_mesh_7 = Mesh_3.GetSubMesh( Cuad_1_Y, 'Sub-mesh_7' )


## Set names of Mesh objects
smesh.SetName(cuad_2_X_2, 'cuad_2_X')
smesh.SetName(Regular_1D.GetAlgorithm(), 'Regular_1D')
smesh.SetName(Quadrangle_2D.GetAlgorithm(), 'Quadrangle_2D')
smesh.SetName(Number_of_Segments_1, 'Number of Segments_1')
smesh.SetName(Quadrangle_Parameters_2, 'Quadrangle Parameters_2')
smesh.SetName(Quadrangle_Parameters_1, 'Quadrangle Parameters_1')
smesh.SetName(Quadrangle_Parameters_4, 'Quadrangle Parameters_4')
smesh.SetName(fixa, 'fixa')
smesh.SetName(Quadrangle_Parameters_3, 'Quadrangle Parameters_3')
smesh.SetName(Number_of_Segments_2, 'Number of Segments_2')
smesh.SetName(carga, 'carga')
smesh.SetName(Sub_mesh_5, 'Sub-mesh_5')
smesh.SetName(Quadrangle_Parameters_5, 'Quadrangle Parameters_5')
smesh.SetName(Sub_mesh_6, 'Sub-mesh_6')
smesh.SetName(Sub_mesh_3, 'Sub-mesh_3')
smesh.SetName(Sub_mesh_4, 'Sub-mesh_4')
smesh.SetName(Mesh_1.GetMesh(), 'Mesh_1')
smesh.SetName(Mesh_3.GetMesh(), 'Mesh_3')
smesh.SetName(Fixa_2, 'Fixa')
smesh.SetName(Mesh_2.GetMesh(), 'Mesh_2')
smesh.SetName(cuad_2_Y_2, 'cuad_2_Y')
smesh.SetName(Compound_Mesh_1.GetMesh(), 'Compound_Mesh_1')
smesh.SetName(Cuad_1_Y_2, 'Cuad_1_Y')
smesh.SetName(Cuad_1_X_2, 'Cuad_1_X')
smesh.SetName(cuad_chic_X_2, 'cuad_chic_X')
smesh.SetName(cuad_2_X_3, 'cuad_2_X')
smesh.SetName(cuad_chic_Y_2, 'cuad_chic_Y')
smesh.SetName(Cuad_1_Y_1, 'Cuad_1_Y')
smesh.SetName(Cuad_1_X_1, 'Cuad_1_X')
smesh.SetName(Fixa_1, 'Fixa')
smesh.SetName(Sub_mesh_2, 'Sub-mesh_2')
smesh.SetName(Sub_mesh_1, 'Sub-mesh_1')
smesh.SetName(cuad_1_Y, 'cuad_1_Y')
smesh.SetName(Quadrangle_Parameters_6, 'Quadrangle Parameters_6')
smesh.SetName(cuad_2_X_1, 'cuad_2_X')
smesh.SetName(Sub_mesh_7, 'Sub-mesh_7')
smesh.SetName(cuad_chic_X_1, 'cuad_chic_X')
smesh.SetName(cuad_chic_Y_1, 'cuad_chic_Y')
smesh.SetName(cuad_2_Y_1, 'cuad_2_Y')


if salome.sg.hasDesktop():
  salome.sg.updateObjBrowser(True)
