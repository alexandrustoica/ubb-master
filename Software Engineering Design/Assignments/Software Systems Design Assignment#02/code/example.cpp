
vtkPExodusIIReader *reader =
    vtkPExodusIIReader::New();
reader->SetFileName("example.exo");

vtkContourFilter *contour =
    vtkContourFilter::New();
contour->SetInputConnection(
    reader->GetOutputPort());
contour->SetNumberOfContours(1);
contour->SetValue(0, 200);

vtkQuadricDecimation *qd =
    vtkQuadricDecimation::New();
qd->SetInputConnection(
    contour->GetOutputPort());
qd->SetTargetReduction(0.75);

vtkXMLPolyDataWriter *writer =
    vtkXMLPolyDataWriter::New();
writer->SetInputConnection(
    qd->GetOuputPort());
writer->SetFileName("output.vtp");