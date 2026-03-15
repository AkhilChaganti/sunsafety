export async function onRequestGet(context) {
  try {
    const db = context.env.sunsafety_db;

    if (!db) {
      throw new Error("D1 binding 'sunsafety_db' is missing");
    }

    const { results } = await db
      .prepare(`
        SELECT
          year,
          data_type,
          count AS cases_count,
          age_standardised_rate_2001_asp AS age_standardised_rate,
          icd10_codes
        FROM skin_cancer_stats
        ORDER BY year ASC
      `)
      .all();

    return new Response(JSON.stringify(results), {
      headers: {
        "Content-Type": "application/json"
      },
      status: 200
    });
  } catch (e) {
    return new Response(
      JSON.stringify({
        error: "Failed to fetch skin cancer statistics",
        details: e.message
      }),
      {
        headers: {
          "Content-Type": "application/json"
        },
        status: 500
      }
    );
  }
}