import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.Arrays;
import java.lang.reflect.Method;
import java.util.stream.Collectors;

public class Asn4Test {

  private static final Customer[] CUSTOMERS = {
    new Customer("0001", "Alexis", "Feil", 35, "USA"),
    new Customer("0002", "Fredrick", "McLaughlin", 14, "Canada"),
    new Customer("0003", "Jonna", "Daniel", 36, "Mexico"),
    new Customer("0004", "Sean", "Cremin", 64, "USA"),
    new Customer("0005", "Hector", "Hirthe", 65, "Canada"),
    new Customer("0006", "Julius", "Swift", 70, "Mexico"),
    new Customer("0007", "Clemente", "Davidson", 40, "USA"),
    new Customer("0008", "Carter", "Kerluke", 3, "Canada"),
    new Customer("0009", "Lauryn", "Hilpert", 18, "Mexico"),
    new Customer("0010", "Josh", "Kling", 17, "USA")
  };

  private static Method getMethod(Class cls, String name, Class<?>... parameterTypes) {
    try {
      return cls.getDeclaredMethod(name, parameterTypes);
    }
    catch (Exception ex) {
      return null;
    }
  }

  private static CustomerManager createCustomerManager() {
    CustomerManager mgr = new CustomerManager();
    mgr.addAll(Arrays.asList(CUSTOMERS));
    return mgr;
  }

  private static int testGetCustomersCorrectlyEvaluatesAPredicate() throws Exception {
    System.out.print("GetCustomersBy() correctly evaluates a predicate: ");

    try {
      CustomerManager mgr = createCustomerManager();
      Predicate<Customer> p = (c -> c.getAge() >= 30 && c.getAge() < 40);
      Method mth = getMethod(mgr.getClass(), "getCustomersBy", Predicate.class);
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }

      List<Customer> results = (List<Customer>)mth.invoke(mgr, p);
      String actual = results.stream().map(x -> x.getLastName()).collect(Collectors.joining(","));
      String expected = "Feil,Daniel";

      if (expected.equals(actual)) {
        System.out.println("PASSED");
        return 1;
      }
      else {
        System.out.println("FAILED (actual != expected)");
        return 0;
      }
    }
    catch (Exception ex) {
      System.out.println("FAILED (exception: " + ex.toString() + ")");
      return 0;
    }
  }

  private static int testGetSeniorsReturnsEveryone65YearsOrOlder() throws Exception {
    System.out.print("GetSeniors() returns everyone 65 years or older: ");

    try {
      CustomerManager mgr = createCustomerManager();
      Method mth = getMethod(mgr.getClass(), "getSeniors");
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }
      
      List<Customer> results = (List<Customer>)mth.invoke(mgr);
      String actual = results.stream().map(x -> x.getLastName()).collect(Collectors.joining(","));
      String expected = "Hirthe,Swift";

      if (expected.equals(actual)) {
        System.out.println("PASSED");
        return 1;
      }
      else {
        System.out.println("FAILED (actual != expected)");
        return 0;
      }
    }
    catch (Exception ex) {
      System.out.println("FAILED (exception: " + ex.toString() + ")");
      return 0;
    }
  }

  private static int testGetChildrenReturnsEveryoneUnder18() throws Exception {
    System.out.print("GetChildren() returns everyone UNDER 18: ");

    try {
      CustomerManager mgr = createCustomerManager();
      Method mth = getMethod(mgr.getClass(), "getChildren");
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }
      
      List<Customer> results = (List<Customer>)mth.invoke(mgr);
      String actual = results.stream().map(x -> x.getLastName()).collect(Collectors.joining(","));
      String expected = "McLaughlin,Kerluke,Kling";
    
      if (expected.equals(actual)) {
        System.out.println("PASSED");
        return 1;
      }
      else {
        System.out.println("FAILED (actual != expected)");
        return 0;
      }
    }
    catch (Exception ex) {
      System.out.println("FAILED (exception: " + ex.toString() + ")");
      return 0;
    }
  }

  private static int testGetCustomersFromReturnsTheCorrectList() throws Exception {
    System.out.print("GetCustomersFrom() returns the correct list: ");

    try {
      CustomerManager mgr = createCustomerManager();
      Method mth = getMethod(mgr.getClass(), "getCustomersFrom", String.class);
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }
      
      List<Customer> results = (List<Customer>)mth.invoke(mgr, "Canada");
      String actual = results.stream().map(x -> x.getLastName()).collect(Collectors.joining(","));
      String expected = "McLaughlin,Hirthe,Kerluke";

      if (expected.equals(actual)) {
        System.out.println("PASSED");
        return 1;
      }
      else {
        System.out.println("FAILED (actual != expected)");
        return 0;
      }
    }
    catch (Exception ex) {
      System.out.println("FAILED (exception: " + ex.toString() + ")");
      return 0;
    }
  }

  private static int testGetCustomersByLastNamePrefixReturnsTheCorrectList() throws Exception {
    System.out.print("GetCustomersByLastNamePrefix() returns the correct list: ");

    try {
      CustomerManager mgr = createCustomerManager();
      Method mth = getMethod(mgr.getClass(), "getCustomersByLastNamePrefix", String.class);
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }
      
      List<Customer> results = (List<Customer>)mth.invoke(mgr, "Da");
      String actual = results.stream().map(x -> x.getLastName()).collect(Collectors.joining(","));
      String expected = "Daniel,Davidson";

      if (expected.equals(actual)) {
        System.out.println("PASSED");
        return 1;
      }
      else {
        System.out.println("FAILED (actual != expected)");
        return 0;
      }
    }
    catch (Exception ex) {
      System.out.println("FAILED (exception: " + ex.toString() + ")");
      return 0;
    }
  
  }

  private static int testMethodsDoNotModifyTheList() throws Exception {
    System.out.print("Methods do not modify the list: ");

    try {
      CustomerManager mgr = createCustomerManager();
      Method mth = getMethod(mgr.getClass(), "getCustomersByLastNamePrefix", String.class);
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }
      
      List<Customer> results = (List<Customer>)mth.invoke(mgr, "Da");

      mth = getMethod(mgr.getClass(), "getSeniors");
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }

      results = (List<Customer>)mth.invoke(mgr);

      mth = getMethod(mgr.getClass(), "getChildren");
      
      if (mth == null) {
        System.out.println("FAILED (method not found)");
        return 0;
      }

      results = (List<Customer>)mth.invoke(mgr);

      if (results.size() != 3 || mgr.size() != 10) {
        System.out.println("FAILED (list was modified)");
        return 0;
      }

      System.out.println("PASSED");
      return 1;
    }
    catch (Exception ex) {
      System.out.println("FAILED (exception: " + ex.toString() + ")");
      return 0;
    }
  
  }

  public static void main(String[] args) throws Exception {
    int passed = 0;
    passed += testGetCustomersCorrectlyEvaluatesAPredicate();
    passed += testGetSeniorsReturnsEveryone65YearsOrOlder();
    passed += testGetChildrenReturnsEveryoneUnder18();
    passed += testGetCustomersFromReturnsTheCorrectList();
    passed += testGetCustomersByLastNamePrefixReturnsTheCorrectList();
    passed += testMethodsDoNotModifyTheList();

    System.out.println("q9:" + passed + "/6");
    
  }

}

