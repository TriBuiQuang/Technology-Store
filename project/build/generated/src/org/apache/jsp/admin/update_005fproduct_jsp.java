package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.ProductDAO;
import model.Product;
import java.util.ArrayList;
import model.Category;
import dao.CategoryDAO;
import model.Brand;
import dao.BrandDAO;

public final class update_005fproduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_url_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_url_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
    _jspx_tagPool_c_url_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Cập nhật sản phẩm</title>\n");
      out.write("        ");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${root}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/css/mos-style.css\" rel='stylesheet' type='text/css' />\n");
      out.write("        <script src=\"");
      if (_jspx_meth_c_url_0(_jspx_page_context))
        return;
      out.write("\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String product_id = "";
            if (request.getParameter("product_id") != null) {
                product_id = request.getParameter("product_id");
                product = productDAO.getProduct(Integer.parseInt(product_id));
            }
        
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("            <div id=\"wrapper\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\n");
      out.write("                <div id=\"rightContent\">\n");
      out.write("                    <h3>Cập nhật sản phẩm</h3>\n");
      out.write("                    <form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${root}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/ManagerProductServlet\" method=\"POST\">\n");
      out.write("                    <table width=\"95%\">\n");
      out.write("                        <tr><td><b>Tên sản phẩm</b></td>\n");
      out.write("                            <td><input type=\"text\" name=\"tenSanpham\" class=\"sedang\" value=\"");
      out.print(product.getProductName());
      out.print(error);
      out.write("\"></td>\n");
      out.write("                        </tr>                       \n");
      out.write("                        <tr>\n");
      out.write("                            <td><b>Giá bán</b></td>\n");
      out.write("                            <td><input type=\"text\" name=\"giaSanpham\" class=\"sedang\" value=\"");
      out.print(product.getProductPrice());
      out.write("\"></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr><td><b>Loại sản phẩm</b></td><td>                                \n");
      out.write("                                <select name=\"idDanhmuc\">\n");
      out.write("                                    ");

                                        CategoryDAO categoryDAO = new CategoryDAO();
                                        ArrayList<Category> listCategory = categoryDAO.getListCategory();
                                        int count = 0;
                                        for (Category category : listCategory) {
                                            count++;
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(category.getCategoryID());
      out.write("\" \n");
      out.write("                                            ");
if(product.getCategoryID()==category.getCategoryID()){
      out.write("selected");
}
      out.write(">\n");
      out.write("                                        ");
      out.print(category.getCategoryName());
      out.write("\n");
      out.write("                                    </option>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                            </td></tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><b>Loại thương hiệu</b></td>\n");
      out.write("                            <td>                                \n");
      out.write("                                <select name=\"idThuonghieu\">\n");
      out.write("                                    ");

                                        BrandDAO brandDAO = new BrandDAO();
                                        ArrayList<Brand> listbrand = brandDAO.getListBrand();
                                        int countb = 0;
                                        for (Brand brand : listbrand) {
                                            countb++;
                                    
      out.write("\n");
      out.write("                                    <option  value=\"");
      out.print(brand.getBrandID());
      out.write("\" \n");
      out.write("                                              ");
if(product.getBrand_id()==brand.getBrandID()){
      out.write("selected");
}
      out.write(">\n");
      out.write("                                        ");
      out.print(brand.getBrandName());
      out.write("\n");
      out.write("                                    </option>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr><td><b>Mô tả sản phẩm</b></td>\n");
      out.write("                            <td>\n");
      out.write("                                <textarea class=\"form-textarea\" id=\"noiDung\" name=\"motaSanpham\">\n");
      out.write("                                    ");
      out.print(product.getProductDescription());
      out.write("\n");
      out.write("                                </textarea>\n");
      out.write("                                <script type=\"text/javascript\" language=\"javascript\">\n");
      out.write("                                    CKEDITOR.replace('noiDung', {width: '445px',height: '240px'});\n");
      out.write("                                </script>\n");
      out.write("                                \n");
      out.write("                               \n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr><td><b>Ảnh sản phẩm</b></td>\n");
      out.write("                            <td>\n");
      out.write("                                <img style=\"height: 150px;width: 130px;\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${root}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/images/");
      out.print(product.getProductImage());
      out.write("\"/>\n");
      out.write("                                <br>\n");
      out.write("                                <input type=\"file\" name=\"anhSanpham\" />                                                                 \n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr><td></td><td>\n");
      out.write("                                <input type=\"hidden\" name=\"command\" value=\"update\">\n");
      out.write("                                <input type=\"hidden\" name=\"product_id\" value=\"");
      out.print(product.getProductID());
      out.write("\">\n");
      out.write("                                <input type=\"submit\" class=\"button\" value=\"Lưu dữ liệu\">\n");
      out.write("                    </table>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"clear\"></div>\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("root");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }

  private boolean _jspx_meth_c_url_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_0.setPageContext(_jspx_page_context);
    _jspx_th_c_url_0.setParent(null);
    _jspx_th_c_url_0.setValue("/ckeditor/ckeditor.js");
    int _jspx_eval_c_url_0 = _jspx_th_c_url_0.doStartTag();
    if (_jspx_th_c_url_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
      return true;
    }
    _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
    return false;
  }
}
