
# para pasar .m a vtu
# previo haber corrido analysis

SOL = struct('Name','U','Type','PointData','NumberOfComponents',3,'Value',u)
mtl2vtu('pp.vtu',xx,struct('Connectivity',conec,'Type','HEXA8'),u)
