package com.eyougo.blog.web.controller;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.LinkBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Link;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * User: mei
 * Date: 8/24/13
 * Time: 18:12
 */
@Controller
@RequestMapping("/admin/link")
public class AdminLinkController {
    private static final Log LOG = LogFactory.getLog(AdminLinkController.class);
    @Autowired
    private LinkBiz linkBiz;

    @RequestMapping("/list")
    public String list(@RequestParam(required=false, defaultValue="1") Integer page, Model model){
        Pager pager = new Pager();
        pager.setPage(page);
        pager.setPerPageNum(10);

        List<Link> linkList = linkBiz.getLinkList(pager);
        model.addAttribute("linkList", linkList);
        model.addAttribute("pager", pager);
        return "admin/admin_link.ftl";
    }

    @RequestMapping(value="/add", method= RequestMethod.POST)
    public String postAdd(Link link) throws InternalException {
        try {
            linkBiz.saveLink(link);
        } catch (InternalException e) {
            LOG.error(e.getMessage(), e);
            throw e;
        }
        return "redirect:/admin/link/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam List<Integer> linkIds) throws InternalException {
        for (Integer linkId:linkIds){
            try {
                linkBiz.deleteLinkById(linkId);
            } catch (InternalException e) {
                LOG.error(e.getMessage(), e);
                throw e;
            }
        }
        return "redirect:/admin/link/list";
    }

}
