#pragma checksum "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "0986f46aa76cc7d6a90a5b6aedade2d3cc847088"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_TypeMaintenance_Index), @"mvc.1.0.view", @"/Views/TypeMaintenance/Index.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0986f46aa76cc7d6a90a5b6aedade2d3cc847088", @"/Views/TypeMaintenance/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b6ee62648b1214f46162f2ec5276ad59d746ae88", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_TypeMaintenance_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<PFE.HOTIX.WEB.Models.TypeMaintenanceModel>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Typemaintenance", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Ajouter", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("btn btn-default bg-info  mb-3"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("style", new global::Microsoft.AspNetCore.Html.HtmlString("width:auto"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
  
    ViewData["Title"] = " Liste des typse maintenance";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<section class=\"content-header\">\r\n    <div class=\"container-fluid\">\r\n        <div class=\"row mb-2\">\r\n\r\n            <div class=\"col-sm-12\">\r\n                <ol class=\"breadcrumb float-sm-right\">\r\n                    <li class=\"breadcrumb-item\">");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0986f46aa76cc7d6a90a5b6aedade2d3cc8470885131", async() => {
                WriteLiteral("Ajouter un type");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>

<div class=""card-header"">
    <section class=""content"">
        <!-- Default box -->
        <div class=""card card-teal"">
            <div class=""card-header"">
                <h3 class=""card-title"">Liste des types de maintenance</h3>

                <div class=""card-tools"">
                    <button type=""button"" class=""btn btn-tool"" data-card-widget=""collapse"" title=""Collapse"">
                        <i class=""fas fa-minus""></i>
                    </button>
");
            WriteLiteral(@"                </div>
            </div>

            <div class=""card-body p-0"">
                <table class=""table table-striped projects"">
                    <thead>
                        <tr>


                            <th style=""width: 25%"">
                                Nom


                    </thead>
                    <tbody>
");
#nullable restore
#line 48 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
                         foreach (var item in Model.Types_Maintenances)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <tr>\r\n\r\n                                <td>");
#nullable restore
#line 52 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
                               Write(item.name_type);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n\r\n\r\n                                <td class=\"project-actions text-right\">\r\n\r\n\r\n                                    <a class=\"btn btn-info btn-sm\"");
            BeginWriteAttribute("href", " href=\'", 1988, "\'", 2093, 1);
#nullable restore
#line 58 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
WriteAttributeValue("", 1995, Url.Action("Modifier", "Typemaintenance", new { id_type_maintenance = @item.id_type_maintenance}), 1995, 98, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n                                        <i class=\"fas fa-pencil-alt\">\r\n                                        </i>\r\n                                        Modifier\r\n                                    </a>\r\n                                    <a");
            BeginWriteAttribute("href", " href=\"", 2344, "\"", 2351, 0);
            EndWriteAttribute();
            BeginWriteAttribute("onclick", " onclick=\"", 2352, "\"", 2397, 3);
            WriteAttributeValue("", 2362, "Delete(\'", 2362, 8, true);
#nullable restore
#line 63 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
WriteAttributeValue("", 2370, item.id_type_maintenance, 2370, 25, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 2395, "\')", 2395, 2, true);
            EndWriteAttribute();
            WriteLiteral(@" class=""btn btn-danger btn-sm"">
                                        <i class=""fas fa-trash""> </i>
                                        Supprimer
                                    </a>
                                </td>
                            </tr>
");
#nullable restore
#line 69 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
                        }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"                    </tbody>
                </table>
            </div>

    </section>
</div>






<script>
    function Delete(id_type_maintenance) {
        var txt;
        var r = confirm(""voulez-vous vraiment supprimer cette type de maintenance"");
        if (r == true) {

            $.ajax(
                {
                    type: ""POST"",
                    url: '");
#nullable restore
#line 91 "C:\Users\syrin\Desktop\PFE HOTIX save le 08-05-2023\PFE HOTIX 1\PFE.HOTIX.WEB\Views\TypeMaintenance\Index.cshtml"
                     Write(Url.Action("Supprimer", "Typemaintenance"));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"',
                    data: {
                        id_type_maintenance: id_type_maintenance
                    },

                    success: function (result) {
                        if (result == true) {
                            //alert(""Success!"");
                            var baseUrl = ""/Typemaintenance"";
                            window.location.href = baseUrl;

                        }
                        else {
                            alert(""There is a problem, Try Later!"");
                        }
                    },
                    error: function (result) {
                        alert(""error"");
                    }
                });
        }
    }
</script>







");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<PFE.HOTIX.WEB.Models.TypeMaintenanceModel> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
