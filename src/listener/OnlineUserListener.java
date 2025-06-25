package listener;

import model.User; // 确保导入了User类

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class OnlineUserListener implements HttpSessionListener, HttpSessionAttributeListener {

    // 用于在 ServletContext 中存储已登录用户计数的键名
    public static final String LOGGED_IN_USER_COUNT_KEY = "loggedInUserCount";
    // Session中存储当前登录用户对象的键名 (与LoginServlet一致)
    public static final String CURRENT_USER_SESSION_KEY = "currentUser";

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Session created (ID: " + se.getSession().getId() + "). Not yet counted as logged-in user.");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        User loggedInUser = (User) session.getAttribute(CURRENT_USER_SESSION_KEY); // 使用 "currentUser"

        if (loggedInUser != null) {
            ServletContext ctx = session.getServletContext();
            synchronized (ctx) {
                Integer count = (Integer) ctx.getAttribute(LOGGED_IN_USER_COUNT_KEY);
                if (count != null && count > 0) {
                    count--;
                    ctx.setAttribute(LOGGED_IN_USER_COUNT_KEY, count);
                    System.out.println("Logged-in user session destroyed (User: " + loggedInUser.getUsername() + "). Count is now: " + count);
                } else if (count == null) {
                    ctx.setAttribute(LOGGED_IN_USER_COUNT_KEY, 0);
                    System.out.println("Logged-in user session destroyed (User: " + loggedInUser.getUsername() + "). Count was null, now 0.");
                }
            }
        }
        System.out.println("Session destroyed (ID: " + session.getId() + ")");
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        if (CURRENT_USER_SESSION_KEY.equals(event.getName())) { // 检查是否是 "currentUser" 属性
            Object userObject = event.getValue();
            if (userObject instanceof User) {
                User loggedInUser = (User) userObject;
                ServletContext ctx = event.getSession().getServletContext();
                synchronized (ctx) {
                    Integer count = (Integer) ctx.getAttribute(LOGGED_IN_USER_COUNT_KEY);
                    if (count == null) {
                        count = 0;
                    }
                    count++;
                    ctx.setAttribute(LOGGED_IN_USER_COUNT_KEY, count);
                    System.out.println("User '" + loggedInUser.getUsername() + "' logged in. LoggedInUserCount is now: " + count);
                }
            }
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        if (CURRENT_USER_SESSION_KEY.equals(event.getName())) { // 检查是否是 "currentUser" 属性
            Object userObject = event.getValue();
            if (userObject instanceof User) {
                User loggedOutUser = (User) userObject;
                System.out.println("Attribute '" + CURRENT_USER_SESSION_KEY + "' removed for user: " + loggedOutUser.getUsername());
                // 注意：如果session.invalidate()被调用（如LogoutServlet中），
                // sessionDestroyed会处理计数。这里主要是为了完整性或处理特殊登出场景。
                // 为避免重复计数，通常依赖sessionDestroyed。
            }
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        if (CURRENT_USER_SESSION_KEY.equals(event.getName())) { // 检查是否是 "currentUser" 属性
            System.out.println("Attribute '" + CURRENT_USER_SESSION_KEY + "' has been replaced in session " + event.getSession().getId());
            Object oldValue = event.getValue(); // 旧值
            Object newValue = event.getSession().getAttribute(CURRENT_USER_SESSION_KEY); // 新值

            ServletContext ctx = event.getSession().getServletContext();
            synchronized (ctx) {
                Integer count = (Integer) ctx.getAttribute(LOGGED_IN_USER_COUNT_KEY);
                if (count == null) {
                    count = 0;
                }

                boolean oldUserExistedAndLoggedOut = false;
                if (oldValue instanceof User) {
                    // HttpSessionBindingEvent 的 getValue() 在 attributeReplaced 中返回的是旧值
                    System.out.println("Old user " + ((User)oldValue).getUsername() + " effectively logged out (attribute replaced).");
                    oldUserExistedAndLoggedOut = true;
                }

                boolean newUserIsLoggingIn = false;
                if (newValue instanceof User) {
                    System.out.println("New user " + ((User)newValue).getUsername() + " effectively logged in (attribute replaced).");
                    newUserIsLoggingIn = true;
                }

                if(oldUserExistedAndLoggedOut && count > 0) {
                    count--;
                }
                if(newUserIsLoggingIn) {
                    count++;
                }

                ctx.setAttribute(LOGGED_IN_USER_COUNT_KEY, count);
                System.out.println("LoggedInUserCount after attributeReplaced: " + count);
            }
        }
    }
}