#pragma checksum "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "6e0964b43ce8a53ad031072737b8a55372f4e285"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_DemandeReservation_Affecter), @"mvc.1.0.view", @"/Views/DemandeReservation/Affecter.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\_ViewImports.cshtml"
using PFE.HOTIX.WEB;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\_ViewImports.cshtml"
using PFE.HOTIX.WEB.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6e0964b43ce8a53ad031072737b8a55372f4e285", @"/Views/DemandeReservation/Affecter.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b6ee62648b1214f46162f2ec5276ad59d746ae88", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_DemandeReservation_Affecter : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<PFE.HOTIX.WEB.Models.ReservationViewModel>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
  
    ViewData["Title"] = "liste des voiture pour valider";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<div class=""card-header"">
    <section class=""content"">
        <!-- Default box -->
        <div class=""card card-teal"">
            <div class=""card-header"">
                <h3 class=""card-title"">Liste des voitures</h3>

                <div class=""card-tools"">
                    <button type=""button"" class=""btn btn-tool"" data-card-widget=""collapse"" title=""Collapse"">
                        <i class=""fas fa-minus""></i>
                    </button>
");
            WriteLiteral(@"                </div>
            </div>

            <div class=""card-body p-0"">
                <table id=""example5"" class=""table  table-striped projects"">
                    <thead>
                        <tr>

                            <th style=""width: 12%"">
                                Matricule voiture

                            </th>
                            <th style=""width: 9%"">
                                Couleur voiture

                            </th>

                            <th style=""width:12%"">
                                Kilommetrage voiture
                            </th>

                            <th style=""width: 9%"">
                                Annee voiture
                            </th>

                            <th style=""width:12%"">
                                Nombre place
                            </th>

                            <th style=""width: 7%"">
                                Parc
              ");
            WriteLiteral(@"              </th>

                            <th style=""width: 7%"">
                                Model
                            </th>

                            <th style=""width: 7%"">
                                Marque
                            </th>

                            <th style=""width: 7%"">
                                État
                            </th>
                        </tr>

                    </thead>
                    <tbody>
");
#nullable restore
#line 68 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                         foreach (var item in Model.Voitures)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <tr>\r\n                                <td>");
#nullable restore
#line 71 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.matricule_voiture);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                <td>");
#nullable restore
#line 72 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.couleur_voiture);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                <td>");
#nullable restore
#line 73 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.Kilommetrage_Voiture);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                <td>");
#nullable restore
#line 74 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.annee_voiture);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                <td>");
#nullable restore
#line 75 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.nbre_place);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                               <td> ");
#nullable restore
#line 76 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.Parc.nom_parc);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                <td>");
#nullable restore
#line 77 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.Model.name_model);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                <td>");
#nullable restore
#line 78 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                               Write(item.Marque.marque_name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                                 \r\n                                <td>\r\n");
#nullable restore
#line 81 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                                      
                                        switch (@item.Etat.id_etat)
                                        {
                                            case 1:

#line default
#line hidden
#nullable disable
            WriteLiteral("                                                <span class=\"badge bg-success\">");
#nullable restore
#line 85 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                                                                          Write(item.Etat.etat_name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\r\n");
#nullable restore
#line 86 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                                                break;
                                            case 2:

#line default
#line hidden
#nullable disable
            WriteLiteral("                                                <span class=\"badge bg-primary\">");
#nullable restore
#line 88 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                                                                          Write(item.Etat.etat_name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\r\n");
#nullable restore
#line 89 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"

                                                break;
                                            case 3:

#line default
#line hidden
#nullable disable
            WriteLiteral("                                                <span class=\"badge bg-warning\">");
#nullable restore
#line 92 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                                                                          Write(item.Etat.etat_name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\r\n");
#nullable restore
#line 93 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"

                                                break;
                                            case 4:

#line default
#line hidden
#nullable disable
            WriteLiteral("                                                <span class=\"badge bg-danger\">");
#nullable restore
#line 96 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                                                                         Write(item.Etat.etat_name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\r\n");
#nullable restore
#line 97 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"

                                                break;
                                        }
                                    

#line default
#line hidden
#nullable disable
            WriteLiteral("                                </td>\r\n\r\n\r\n                                <td class=\"project-actions text-right\">\r\n                                    <a class=\"btn btn-success btn-sm\"");
            BeginWriteAttribute("href", " href=\'", 4302, "\'", 4465, 1);
#nullable restore
#line 105 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
WriteAttributeValue("", 4309, Url.Action("AffecterVoiture", "DemandeReservation", new { id_reservation = @Model.Reservation.id_reservation, matricule_voiture = @item.matricule_voiture}), 4309, 156, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n                                        <i class=\"fas fa-check\"></i> Valider\r\n                                    </a>\r\n\r\n                                </td>\r\n                            </tr>\r\n");
#nullable restore
#line 111 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\DemandeReservation\Affecter.cshtml"
                        }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    </tbody>\r\n                </table>\r\n            </div>\r\n        </div>\r\n    </section>\r\n\r\n\r\n    <!-- Page specific script -->\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral(@"
        <script>
            $(function () {
                $(""#example5"").DataTable({
                    ""responsive"": false, ""lengthChange"": false, ""autoWidth"": false,
                    ""buttons"": [""copy"", ""csv"", ""excel"", ""pdf"", ""print"", ""colvis""]
                }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

            });
        </script>
    ");
            }
            );
            WriteLiteral("\r\n  ");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<PFE.HOTIX.WEB.Models.ReservationViewModel> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
