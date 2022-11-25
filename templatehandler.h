#ifndef TEMPLATEHANDLER_H
#define TEMPLATEHANDLER_H
#include <QString>
#include<QFile>
#include<QList>
#include<QMap>

#include<QTextStream>


#include<QtPrintSupport/QPrinter>

class TemplateHandler
{
public:
    TemplateHandler();

    bool cargarTemplate(const QString &file);

    QStringList obtenerCampos();
    void completarCampo(const QString &campo, const QString &contenido);
    void guardarPDF(const QString &file);
    bool guardarTXT(const QString &file);
private:
    QStringList partesPlantilla;
    QStringList tagsCampos;
    QMap<QString, QString> campos;
//    QStringList campos;
    //QList <QList<int>>indicesCampos;

    //int obtenerIndiceCampo(const QString &campo);

};

#endif // TEMPLATEHANDLER_H
